/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.flowable.sql;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.flowable.common.engine.impl.FlowableVersion;
import org.flowable.common.engine.impl.FlowableVersions;

public class CopyUpgradeSqlFromJarGenerator {

    public static void main(String[] args) throws Exception {
    	String databaseName = args[0];
    	
    	generateUpgrade(databaseName);
    }
    
    protected static void generateUpgrade(String databaseName) throws Exception {
    	File upgradeCommonDir = new File("../sql/upgrade/common");
    	if (!upgradeCommonDir.exists()) {
    		upgradeCommonDir.mkdir();
    	}
    	
    	List<FlowableVersion> versionList = FlowableVersions.FLOWABLE_VERSIONS;
    	int startVersion = FlowableVersions.findMatchingVersionIndex(FlowableVersions.LAST_V6_VERSION_BEFORE_SERVICES);
    	String previousVersion = null;
    	for (int i = startVersion; i < versionList.size(); i++) {
    		FlowableVersion version = versionList.get(i);
    		String versionValue = version.getMainVersion().replaceAll("\\.", "");
    		if (previousVersion != null) {
    			StringBuilder upgradeSqlBuilder = new StringBuilder();
    	    	upgradeSqlBuilder.append(getCommonUpgradeSql(databaseName, previousVersion, versionValue));
    	    	upgradeSqlBuilder.append(getServiceUpgradeSql("batch", databaseName, previousVersion, versionValue));
    	    	upgradeSqlBuilder.append(getServiceUpgradeSql("entitylink", databaseName, previousVersion, versionValue));
    	    	upgradeSqlBuilder.append(getServiceUpgradeSql("eventsubscription", databaseName, previousVersion, versionValue));
    	    	upgradeSqlBuilder.append(getServiceUpgradeSql("identitylink", databaseName, previousVersion, versionValue));
    	    	upgradeSqlBuilder.append(getServiceUpgradeSql("job", databaseName, previousVersion, versionValue));
    	    	upgradeSqlBuilder.append(getServiceUpgradeSql("task", databaseName, previousVersion, versionValue));
    	    	upgradeSqlBuilder.append(getServiceUpgradeSql("variable", databaseName, previousVersion, versionValue));
    	    	
    	    	if (!upgradeSqlBuilder.isEmpty()) {
	    	    	File commonFile = new File("../sql/upgrade/common/flowable." + databaseName + ".upgradestep." + previousVersion + ".to." + versionValue + ".common.sql");
	    	    	if (commonFile.exists()) {
	    	    		commonFile.delete();
	    	    	}
	    	    	commonFile.createNewFile();
	    	    	
	    	    	ByteArrayInputStream sqlStream = new ByteArrayInputStream(upgradeSqlBuilder.toString().getBytes(StandardCharsets.UTF_8));
	    	    	
	    	    	BufferedOutputStream outputStream = createAppendableStream(commonFile);
	    			IOUtils.copy(sqlStream, outputStream);
	    			
	    			sqlStream.close();
	    			outputStream.close();

    	    	}
    		}
    		
    		previousVersion = versionValue;
    	}
    }
    
    protected static String getCommonUpgradeSql(String databaseName, String oldVersion, String newVersion) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
		String allResourceName = "org/flowable/common/db/upgrade/flowable.all.upgradestep." + oldVersion + ".to." + newVersion + ".common.sql";
    		
		String commonString = null;
		if (doesSqlFileExists(allResourceName)) {
			commonString = getScriptContent(allResourceName);
		} else {
			String versionResourceName = "org/flowable/common/db/upgrade/flowable." + databaseName + ".upgradestep." + oldVersion + ".to." + newVersion + ".common.sql";
			if (doesSqlFileExists(versionResourceName)) {
				commonString = getScriptContent(versionResourceName);
			}
		}
		
		if (StringUtils.isNotEmpty(commonString) && commonString.trim().length() > 0) {
			sqlBuilder.append(commonString);
			sqlBuilder.append("\n\n");
		}
    	
    	return sqlBuilder.toString();
    }
    
    protected static String getServiceUpgradeSql(String serviceName, String databaseName, String oldVersion, String newVersion) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
    	String allResourceName = "org/flowable/" + serviceName + "/service/db/upgrade/flowable.all.upgradestep." + oldVersion + ".to." + newVersion + "." + serviceName + ".sql";
    		
		String sqlString = null;
		if (doesSqlFileExists(allResourceName)) {
			sqlString = getScriptContent(allResourceName);
		} else {
			String versionResourceName = "org/flowable/" + serviceName + "/service/db/upgrade/flowable." + databaseName + ".upgradestep." + oldVersion + ".to." + newVersion + "." + serviceName + ".sql";
			if (doesSqlFileExists(versionResourceName)) {
				sqlString = getScriptContent(versionResourceName);
			}
		}
    		
		if (StringUtils.isNotEmpty(sqlString)) {
			sqlString = filterInsertPropertyLine(sqlString);
			sqlString = filterUpdatePropertyLine(sqlString);
		}
    		
		if (StringUtils.isNotEmpty(sqlString) && sqlString.trim().length() > 0) {
			if (sqlBuilder.length() > 0) {
				sqlBuilder.append("\n\n");
			}
			sqlBuilder.append(sqlString);
		}
    		
		String historyResourceName = "org/flowable/" + serviceName + "/service/db/upgrade/flowable." + databaseName + ".upgradestep." + oldVersion + ".to." + newVersion + "." + serviceName + ".history.sql";
		if (doesSqlFileExists(historyResourceName)) {
			String historySqlString = getScriptContent(historyResourceName);
			if (historySqlString.trim().length() > 0) {
				sqlBuilder.append("\n");
    			sqlBuilder.append(historySqlString);
    		}
		}
    	
		if (StringUtils.isNotEmpty(sqlString) && sqlString.trim().length() > 0) {
			sqlBuilder.append("\n");
		}
    	
    	return sqlBuilder.toString();
    }
    
    protected static String filterInsertPropertyLine(String sqlString) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
    	BufferedReader reader = new BufferedReader(new StringReader(sqlString));
    	String line = null;
    	while ((line = reader.readLine()) != null) {
    		if (line.trim().length() > 0) {
    			if (!line.contains("insert into ACT_GE_PROPERTY values")) {
    				sqlBuilder.append(line + "\n");
    			}
    		}
    	}
    	
    	return sqlBuilder.toString();
    }
    
    protected static String filterUpdatePropertyLine(String sqlString) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
    	BufferedReader reader = new BufferedReader(new StringReader(sqlString));
    	String line = null;
    	while ((line = reader.readLine()) != null) {
    		if (line.trim().length() > 0) {
    			if (!line.contains("update ACT_GE_PROPERTY set VALUE_ = ")) {
    				sqlBuilder.append(line + "\n");
    			}
    		}
    	}
    	
    	return sqlBuilder.toString();
    }
    
    protected static String getScriptContent(String resourceName) throws Exception {
    	InputStream sqlStream = CopyUpgradeSqlFromJarGenerator.class.getClassLoader().getResourceAsStream(resourceName);
    	return IOUtils.toString(sqlStream, StandardCharsets.UTF_8);
    }
    
    protected static boolean doesSqlFileExists(String resourceName) throws Exception {
    	URL sqlURL = CopyUpgradeSqlFromJarGenerator.class.getClassLoader().getResource(resourceName);
    	return sqlURL != null;
    }

    protected static BufferedOutputStream createAppendableStream(File destination) throws Exception {
        return new BufferedOutputStream(new FileOutputStream(destination, true));
    }

    protected static void appendFile(OutputStream output, File source) throws Exception {
    	try (InputStream input = new BufferedInputStream(new FileInputStream(source))) {
            IOUtils.copy(input, output);
        } 
    }

}
