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
import java.io.SequenceInputStream;
import java.io.StringReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

import org.apache.commons.io.IOUtils;
import org.flowable.common.engine.impl.FlowableVersion;
import org.flowable.common.engine.impl.FlowableVersions;

public class CopyManualSqlFromJarGenerator {

    public static void main(String[] args) throws Exception {
    	String databaseName = args[0];
    	//String oldVersion = args[1];
    	//String newVersion = args[2];
    	
    	//generateUpgrade(databaseName, oldVersion, newVersion);
    	generateCreate(databaseName);
    }
    
    protected static void generateCreate(String databaseName) throws Exception {
    	InputStream commonStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/common/db/create/flowable." + databaseName + ".create.common.sql");
    	InputStream entityLinkStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/entitylink/service/db/create/flowable." + databaseName + ".create.entitylink.sql");
    	InputStream entityLinkHistoryStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/entitylink/service/db/create/flowable." + databaseName + ".create.entitylink.history.sql");
    	InputStream identityLinkStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/identitylink/service/db/create/flowable." + databaseName + ".create.identitylink.sql");
    	InputStream identityLinkHistoryStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/identitylink/service/db/create/flowable." + databaseName + ".create.identitylink.history.sql");
    	InputStream jobStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/job/service/db/create/flowable." + databaseName + ".create.job.sql");
    	InputStream batchStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/batch/service/db/create/flowable." + databaseName + ".create.batch.sql");
    	InputStream taskStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/task/service/db/create/flowable." + databaseName + ".create.task.sql");
    	InputStream taskHistoryStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/task/service/db/create/flowable." + databaseName + ".create.task.history.sql");
    	InputStream variableStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/variable/service/db/create/flowable." + databaseName + ".create.variable.sql");
    	InputStream variableHistoryStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/variable/service/db/create/flowable." + databaseName + ".create.variable.history.sql");
    	InputStream eventSubscriptionStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/eventsubscription/service/db/create/flowable." + databaseName + ".create.eventsubscription.sql");
    	
    	File createCommonDir = new File("../sql/create/common");
    	if (!createCommonDir.exists()) {
    		createCommonDir.mkdir();
    	}
    	
    	File commonFile = new File("../sql/create/common/flowable." + databaseName + ".create.common.sql");
    	if (commonFile.exists()) {
    		commonFile.delete();
    	}
    	commonFile.createNewFile();
    	
    	Vector<InputStream> inputStreams = new Vector<InputStream>();
		inputStreams.add(commonStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(entityLinkStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(entityLinkHistoryStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(identityLinkStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(identityLinkHistoryStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(jobStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(batchStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(taskStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(taskHistoryStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(variableStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(variableHistoryStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(eventSubscriptionStream);

		Enumeration<InputStream> enu = inputStreams.elements();
		SequenceInputStream sequenceStream = new SequenceInputStream(enu);
    	
		BufferedOutputStream outputStream = createAppendableStream(commonFile);
		IOUtils.copy(sequenceStream, outputStream);
		
		commonStream.close();
		entityLinkStream.close();
		entityLinkHistoryStream.close();
		identityLinkStream.close();
		identityLinkHistoryStream.close();
		jobStream.close();
		batchStream.close();
		taskStream.close();
		taskHistoryStream.close();
		variableStream.close();
		variableHistoryStream.close();
		eventSubscriptionStream.close();
		outputStream.close();
		
		InputStream bpmnStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/db/create/flowable." + databaseName + ".create.engine.sql");
		InputStream bpmnHistoryStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/db/create/flowable." + databaseName + ".create.history.sql");
		
		File createBpmnDir = new File("../sql/create/bpmn");
    	if (!createBpmnDir.exists()) {
    		createBpmnDir.mkdir();
    	}
    	
    	File engineFile = new File("../sql/create/bpmn/flowable." + databaseName + ".create.engine.sql");
    	if (engineFile.exists()) {
    		engineFile.delete();
    	}
    	engineFile.createNewFile();
    	
    	Vector<InputStream> bpmnInputStreams = new Vector<InputStream>();
    	bpmnInputStreams.add(bpmnStream);
    	bpmnInputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
    	bpmnInputStreams.add(bpmnHistoryStream);
		
		Enumeration<InputStream> bpmnEnumeration = bpmnInputStreams.elements();
		SequenceInputStream bpmnSequenceStream = new SequenceInputStream(bpmnEnumeration);
    	
		BufferedOutputStream bpmnOutputStream = createAppendableStream(engineFile);
		IOUtils.copy(bpmnSequenceStream, bpmnOutputStream);
		
		bpmnStream.close();
		bpmnHistoryStream.close();
		bpmnOutputStream.close();
		
		InputStream idmStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/idm/db/create/flowable." + databaseName + ".create.identity.sql");
		
		File createIdmDir = new File("../sql/create/idm");
    	if (!createIdmDir.exists()) {
    		createIdmDir.mkdir();
    	}
    	
    	File idmFile = new File("../sql/create/idm/flowable." + databaseName + ".create.identity.sql");
    	if (idmFile.exists()) {
    		idmFile.delete();
    	}
    	idmFile.createNewFile();
    	
    	BufferedOutputStream idmOutputStream = createAppendableStream(idmFile);
		IOUtils.copy(idmStream, idmOutputStream);
		
		idmStream.close();
		idmOutputStream.close();
    }
    
    protected static void generateUpgrade(String databaseName, String oldVersion, String newVersion) throws Exception {
    	List<String> dbVersions = new ArrayList<>();
    	List<FlowableVersion> versionList = FlowableVersions.FLOWABLE_VERSIONS;
    	for (int i = (versionList.size() - 1); i >= 0; i--) {
    		FlowableVersion version = versionList.get(i);
    		if (version.getMainVersion().startsWith(newVersion)) {
    			dbVersions.add(0, versionList.get(i - 1).getMainVersion().replaceAll("\\.", "") + ".to." + 
    					version.getMainVersion().replaceAll("\\.", ""));
    		}
    	}
    	
    	StringBuilder upgradeSqlBuilder = new StringBuilder();
    	upgradeSqlBuilder.append(getCommonUpgradeSql(databaseName, dbVersions));
    	upgradeSqlBuilder.append(getServiceUpgradeSql("entitylink", databaseName, dbVersions));
    	upgradeSqlBuilder.append(getServiceUpgradeSql("identitylink", databaseName, dbVersions));
    	upgradeSqlBuilder.append(getServiceUpgradeSql("job", databaseName, dbVersions));
    	upgradeSqlBuilder.append(getServiceUpgradeSql("task", databaseName, dbVersions));
    	upgradeSqlBuilder.append(getServiceUpgradeSql("variable", databaseName, dbVersions));
    	upgradeSqlBuilder.append(getServiceUpgradeSql("eventsubscription", databaseName, dbVersions));
    	
    	File upgradeCommonDir = new File("../sql/upgrade/common");
    	if (!upgradeCommonDir.exists()) {
    		upgradeCommonDir.mkdir();
    	}
    	
    	File commonFile = new File("../sql/upgrade/common/flowable." + databaseName + ".upgradestep." + oldVersion + ".to." + newVersion + ".common.sql");
    	if (commonFile.exists()) {
    		commonFile.delete();
    	}
    	commonFile.createNewFile();
    	
    	ByteArrayInputStream sqlStream = new ByteArrayInputStream(upgradeSqlBuilder.toString().getBytes(StandardCharsets.UTF_8));
    	
    	BufferedOutputStream outputStream = createAppendableStream(commonFile);
		IOUtils.copy(sqlStream, outputStream);
		
		sqlStream.close();
		outputStream.close();
		
		StringBuilder bpmnUpgradeSqlBuilder = new StringBuilder();
		bpmnUpgradeSqlBuilder.append(getEngineUpgradeSql(databaseName, dbVersions));
		
		File upgradeBpmnDir = new File("../sql/upgrade/bpmn");
    	if (!upgradeBpmnDir.exists()) {
    		upgradeBpmnDir.mkdir();
    	}
    	
    	File engineFile = new File("../sql/upgrade/bpmn/flowable." + databaseName + ".upgradestep." + oldVersion + ".to." + newVersion + ".engine.sql");
    	if (engineFile.exists()) {
    		engineFile.delete();
    	}
    	engineFile.createNewFile();
    	
    	ByteArrayInputStream bpmnSqlStream = new ByteArrayInputStream(bpmnUpgradeSqlBuilder.toString().getBytes(StandardCharsets.UTF_8));
    	
    	BufferedOutputStream bpmnOutputStream = createAppendableStream(engineFile);
		IOUtils.copy(bpmnSqlStream, bpmnOutputStream);
		
		bpmnSqlStream.close();
		bpmnOutputStream.close();
		
		StringBuilder idmUpgradeSqlBuilder = new StringBuilder();
		idmUpgradeSqlBuilder.append(getIdmUpgradeSql(databaseName, dbVersions));
		
		File upgradeIdmDir = new File("../sql/upgrade/idm");
    	if (!upgradeIdmDir.exists()) {
    		upgradeIdmDir.mkdir();
    	}
    	
    	File idmFile = new File("../sql/upgrade/idm/flowable." + databaseName + ".upgradestep." + oldVersion + ".to." + newVersion + ".identity.sql");
    	if (idmFile.exists()) {
    		idmFile.delete();
    	}
    	idmFile.createNewFile();
    	
    	ByteArrayInputStream idmSqlStream = new ByteArrayInputStream(idmUpgradeSqlBuilder.toString().getBytes(StandardCharsets.UTF_8));
    	
    	BufferedOutputStream idmOutputStream = createAppendableStream(idmFile);
		IOUtils.copy(idmSqlStream, idmOutputStream);
		
		idmSqlStream.close();
		idmOutputStream.close();
    }
    
    public static void joinFiles(File destination, File... sources) throws Exception {
        try (OutputStream output = createAppendableStream(destination)) {
            for (File source : sources) {
                appendFile(output, source);
            }
        }
    }
    
    protected static String getCommonUpgradeSql(String databaseName, List<String> dbVersions) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
    	for (int i = 0; i < dbVersions.size(); i++) {
    		String dbVersion = dbVersions.get(i);
    		String allResourceName = "org/flowable/common/db/upgrade/flowable.all.upgradestep." + dbVersion + ".common.sql";
    		
    		String commonString = null;
    		if (doesSqlFileExists(allResourceName)) {
    			commonString = getScriptContent(allResourceName);
    		} else {
    			commonString = getScriptContent("org/flowable/common/db/upgrade/flowable." + databaseName + ".upgradestep." + dbVersion + ".common.sql");
    		}
    		
    		if ((i + 1) < dbVersions.size()) {
    			commonString = filterUpdatePropertyLine(commonString);
    		}
    		
    		if (commonString.trim().length() > 0) {
    			sqlBuilder.append(commonString);
    		}
    	}
    	
    	sqlBuilder.append("\n");
    	
    	return sqlBuilder.toString();
    }
    
    protected static String getServiceUpgradeSql(String serviceName, String databaseName, List<String> dbVersions) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
    	for (int i = 0; i < dbVersions.size(); i++) {
    		String dbVersion = dbVersions.get(i);
    		String allResourceName = "org/flowable/" + serviceName + "/service/db/upgrade/flowable.all.upgradestep." + dbVersion + "." + serviceName + ".sql";
    		
    		String sqlString = null;
    		if (doesSqlFileExists(allResourceName)) {
    			sqlString = getScriptContent(allResourceName);
    		} else {
    			sqlString = getScriptContent("org/flowable/" + serviceName + "/service/db/upgrade/flowable." + databaseName + ".upgradestep." + dbVersion + "." + serviceName + ".sql");
    		}
    		
    		if ((i + 1) < dbVersions.size()) {
    			sqlString = filterUpdatePropertyLine(sqlString);
    		}
    		
    		if (sqlString.trim().length() > 0) {
    			if (sqlBuilder.length() > 0) {
    				sqlBuilder.append("\n");
    			}
    			sqlBuilder.append(sqlString);
    		}
    		
    		String historyResourceName = "org/flowable/" + serviceName + "/service/db/upgrade/flowable." + databaseName + ".upgradestep." + dbVersion + "." + serviceName + "history.sql";
    		if (doesSqlFileExists(historyResourceName)) {
    			String historySqlString = getScriptContent(historyResourceName);
    			if (historySqlString.trim().length() > 0) {
    				sqlBuilder.append("\n");
        			sqlBuilder.append(historySqlString);
        		}
    		}
    	}
    	
    	sqlBuilder.append("\n");
    	
    	return sqlBuilder.toString();
    }
    
    protected static String getEngineUpgradeSql(String databaseName, List<String> dbVersions) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
    	for (int i = 0; i < dbVersions.size(); i++) {
    		String dbVersion = dbVersions.get(i);
    		String allResourceName = "org/flowable/db/upgrade/flowable.all.upgradestep." + dbVersion + ".engine.sql";
    		
    		String sqlString = null;
    		if (doesSqlFileExists(allResourceName)) {
    			sqlString = getScriptContent(allResourceName);
    		} else {
    			sqlString = getScriptContent("org/flowable/db/upgrade/flowable." + databaseName + ".upgradestep." + dbVersion + ".engine.sql");
    		}
    		
    		if ((i + 1) < dbVersions.size()) {
    			sqlString = filterUpdatePropertyLine(sqlString);
    		}
    		
    		if (sqlString.trim().length() > 0) {
    			if (sqlBuilder.length() > 0) {
    				sqlBuilder.append("\n");
    			}
    			sqlBuilder.append(sqlString);
    		}
    		
    		String historyResourceName = "org/flowable/db/upgrade/flowable." + databaseName + ".upgradestep." + dbVersion + ".history.sql";
    		if (doesSqlFileExists(historyResourceName)) {
    			String historySqlString = getScriptContent(historyResourceName);
    			if (historySqlString.trim().length() > 0) {
    				sqlBuilder.append("\n");
        			sqlBuilder.append(historySqlString);
        		}
    		}
    	}
    	
    	sqlBuilder.append("\n");
    	
    	return sqlBuilder.toString();
    }
    
    protected static String getIdmUpgradeSql(String databaseName, List<String> dbVersions) throws Exception {
    	StringBuilder sqlBuilder = new StringBuilder();
    	for (int i = 0; i < dbVersions.size(); i++) {
    		String dbVersion = dbVersions.get(i);
    		String allResourceName = "org/flowable/idm/db/upgrade/flowable.all.upgradestep." + dbVersion + ".identity.sql";
    		
    		String sqlString = null;
    		if (doesSqlFileExists(allResourceName)) {
    			sqlString = getScriptContent(allResourceName);
    		} else {
    			sqlString = getScriptContent("org/flowable/idm/db/upgrade/flowable." + databaseName + ".upgradestep." + dbVersion + ".identity.sql");
    		}
    		
    		if ((i + 1) < dbVersions.size()) {
    			sqlString = filterUpdatePropertyLine(sqlString);
    		}
    		
    		if (sqlString.trim().length() > 0) {
    			if (sqlBuilder.length() > 0) {
    				sqlBuilder.append("\n");
    			}
    			sqlBuilder.append(sqlString);
    		}
    	}
    	
    	sqlBuilder.append("\n");
    	
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
    	InputStream sqlStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream(resourceName);
    	return IOUtils.toString(sqlStream, StandardCharsets.UTF_8);
    }
    
    protected static boolean doesSqlFileExists(String resourceName) throws Exception {
    	URL sqlURL = CopyManualSqlFromJarGenerator.class.getClassLoader().getResource(resourceName);
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
