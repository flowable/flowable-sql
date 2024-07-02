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
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

public class CopyDropSqlFromJarGenerator {

    public static void main(String[] args) throws Exception {
    	String databaseName = args[0];
    	
    	generateDrop(databaseName);
    }
    
    protected static void generateDrop(String databaseName) throws Exception {
    	File dropCommonDir = new File("../sql/drop/common");
    	if (!dropCommonDir.exists()) {
    		dropCommonDir.mkdir();
    	}
    	
    	StringBuilder dropSqlBuilder = new StringBuilder();
    	dropSqlBuilder.append(getServiceDropSql("batch", databaseName));
    	dropSqlBuilder.append(getServiceDropSql("entitylink", databaseName));
    	dropSqlBuilder.append(getServiceDropSql("eventsubscription", databaseName));
    	dropSqlBuilder.append(getServiceDropSql("identitylink", databaseName));
    	dropSqlBuilder.append(getServiceDropSql("job", databaseName));
    	dropSqlBuilder.append(getServiceDropSql("task", databaseName));
    	dropSqlBuilder.append(getServiceDropSql("variable", databaseName));
    	dropSqlBuilder.append(getCommonDropSql(databaseName));
    	
    	File commonFile = new File("../sql/drop/common/flowable." + databaseName + ".drop.common.sql");
    	if (commonFile.exists()) {
    		commonFile.delete();
    	}
    	commonFile.createNewFile();
    	
    	ByteArrayInputStream sqlStream = new ByteArrayInputStream(dropSqlBuilder.toString().getBytes(StandardCharsets.UTF_8));
    	
    	BufferedOutputStream outputStream = createAppendableStream(commonFile);
		IOUtils.copy(sqlStream, outputStream);
		
		sqlStream.close();
		outputStream.close();
    }
    
    protected static String getCommonDropSql(String databaseName) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
		String resourceName = "org/flowable/common/db/drop/flowable." + databaseName + ".drop.common.sql";
    		
		String commonString = getScriptContent(resourceName);
		
		if (StringUtils.isNotEmpty(commonString) && commonString.trim().length() > 0) {
			sqlBuilder.append(commonString);
			sqlBuilder.append("\n\n");
		}
    	
    	return sqlBuilder.toString();
    }
    
    protected static String getServiceDropSql(String serviceName, String databaseName) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
    	String resourceName = "org/flowable/" + serviceName + "/service/db/drop/flowable." + databaseName + ".drop." + serviceName + ".sql";
    		
		String sqlString = getScriptContent(resourceName);
		sqlBuilder.append(sqlString);
		sqlBuilder.append("\n\n");
		
		String historyResourceName = "org/flowable/" + serviceName + "/service/db/drop/flowable." + databaseName + ".drop." + serviceName + ".history.sql";
		if (doesSqlFileExists(historyResourceName)) {
    		String sqlHistoryString = getScriptContent(historyResourceName);
    		sqlBuilder.append(sqlHistoryString);
    		sqlBuilder.append("\n\n");
    	}
		
    	return sqlBuilder.toString();
    }
    
    protected static String getScriptContent(String resourceName) throws Exception {
    	InputStream sqlStream = CopyDropSqlFromJarGenerator.class.getClassLoader().getResourceAsStream(resourceName);
    	return IOUtils.toString(sqlStream, StandardCharsets.UTF_8);
    }
    
    protected static boolean doesSqlFileExists(String resourceName) throws Exception {
    	URL sqlURL = CopyDropSqlFromJarGenerator.class.getClassLoader().getResource(resourceName);
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
