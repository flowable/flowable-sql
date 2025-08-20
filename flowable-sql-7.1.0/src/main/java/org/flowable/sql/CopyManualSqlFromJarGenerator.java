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

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.SequenceInputStream;
import java.util.Enumeration;
import java.util.Vector;

import org.apache.commons.io.IOUtils;

public class CopyManualSqlFromJarGenerator {

    public static void main(String[] args) throws Exception {
    	String databaseName = args[0];
    	
    	generateCreate(databaseName);
    }
    
    protected static void generateCreate(String databaseName) throws Exception {
    	InputStream commonStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/common/db/create/flowable." + databaseName + ".create.common.sql");
    	InputStream bpmnEngineStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/db/create/flowable." + databaseName + ".create.engine.sql");
    	InputStream bpmnHistoryStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/db/create/flowable." + databaseName + ".create.history.sql");
    	InputStream appEngineStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/app/db/create/flowable." + databaseName + ".create.app.sql");
    	InputStream cmmnEngineStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/cmmn/db/create/flowable." + databaseName + ".create.cmmn.sql");
    	InputStream dmnEngineStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/dmn/db/create/flowable." + databaseName + ".create.dmn.sql");
    	InputStream eventRegistryEngineStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/eventregistry/db/create/flowable." + databaseName + ".create.eventregistry.sql");
    	InputStream idmEngineStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream("org/flowable/idm/db/create/flowable." + databaseName + ".create.identity.sql");
    	
    	File createAllDir = new File("../sql/create/all");
    	if (!createAllDir.exists()) {
    		createAllDir.mkdir();
    	}
    	
    	File allFile = new File("../sql/create/all/flowable." + databaseName + ".all.create.sql");
    	if (allFile.exists()) {
    		allFile.delete();
    	}
    	allFile.createNewFile();
    	
    	Vector<InputStream> inputStreams = new Vector<InputStream>();
		inputStreams.add(commonStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(bpmnEngineStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(bpmnHistoryStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(appEngineStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(cmmnEngineStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(dmnEngineStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(eventRegistryEngineStream);
		inputStreams.add(new ByteArrayInputStream(new String("\n\n").getBytes()));
		inputStreams.add(idmEngineStream);

		Enumeration<InputStream> enu = inputStreams.elements();
		SequenceInputStream sequenceStream = new SequenceInputStream(enu);
    	
		BufferedOutputStream outputStream = createAppendableStream(allFile);
		IOUtils.copy(sequenceStream, outputStream);
		
		commonStream.close();
		bpmnEngineStream.close();
		bpmnHistoryStream.close();
		appEngineStream.close();
		cmmnEngineStream.close();
		dmnEngineStream.close();
		eventRegistryEngineStream.close();
		idmEngineStream.close();
		outputStream.close();
    }
    
    protected static BufferedOutputStream createAppendableStream(File destination) throws Exception {
        return new BufferedOutputStream(new FileOutputStream(destination, true));
    }

}
