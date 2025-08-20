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
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.ListIterator;

import org.apache.commons.io.IOUtils;
import org.flowable.common.engine.impl.FlowableVersion;
import org.flowable.common.engine.impl.FlowableVersions;

public class CopyManualSqlFromJarGenerator {

    private static final String PREVIOUS_DB_VERSION = "7.1.0.2";

    public static void main(String[] args) throws Exception {
        String previousDbVersion = args[0];
        String fromFlowableVersion = args[1];
        String toFlowableVersion = args[2].replace("-SNAPSHOT", "");
        List<String> databases = List.of("db2", "mssql", "mysql", "oracle", "postgres");
        for (String databaseName : databases) {
            generateCreate(databaseName);
        }

        for (String databaseName : databases) {
            generateUpgrade(databaseName, previousDbVersion, fromFlowableVersion, toFlowableVersion);
        }
    }

    protected static void generateCreate(String databaseName) throws Exception {
        File createAllDir = new File("../sql/create/all");
        if (!createAllDir.exists()) {
            createAllDir.mkdirs();
        }

        File allFile = new File("../sql/create/all/flowable." + databaseName + ".all.create.sql");
        if (allFile.exists()) {
            allFile.delete();
        }
        allFile.createNewFile();

        try (BufferedOutputStream outputStream = createAppendableStream(allFile)) {
            SqlComponents[] sqlComponents = SqlComponents.values();
            for (int i = 0; i < sqlComponents.length; i++) {
                if (i > 0) {
                    outputStream.write("\n\n".getBytes());
                }
                String sqlFile = sqlComponents[i].createSqlFile(databaseName);
                try (InputStream sqlStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream(sqlFile.formatted(databaseName))) {
                    IOUtils.copy(sqlStream, outputStream);
                }
            }
        }

    }

    protected static void generateUpgrade(String databaseName, String fromFlowableDbVersion, String fromFlowableVersion, String toFlowableVersion)
            throws Exception {
        File upgradeAllDir = new File("../sql/upgrade/all");
        if (!upgradeAllDir.exists()) {
            upgradeAllDir.mkdirs();
        }

        int fromDbVersionIndex = FlowableVersions.findMatchingVersionIndex(fromFlowableDbVersion);
        if (fromDbVersionIndex == -1 || fromDbVersionIndex == FlowableVersions.FLOWABLE_VERSIONS.size() - 1) {
            return;
        }

        File upgradeAllFile = new File(
                "../sql/upgrade/all/flowable.%s.upgradestep.%s.to.%s.all.sql".formatted(databaseName, fromFlowableVersion, toFlowableVersion));
        if (upgradeAllFile.exists()) {
            upgradeAllFile.delete();
        }
        upgradeAllFile.createNewFile();

        //flowable.<databaseName>.upgradestep.<fromDbVersion>.to.<toDbVersion>.<component>.sql
        //flowable.all.upgradestep.<fromDbVersion>.to.<toDbVersion>.<component>.sql

        String upgradeFileFormat = "%s/upgrade/flowable.%s.upgradestep.%s.to.%s.%s.sql";
        ListIterator<FlowableVersion> versionsIterator = FlowableVersions.FLOWABLE_VERSIONS.listIterator(fromDbVersionIndex);

        try (BufferedOutputStream outputStream = createAppendableStream(upgradeAllFile)) {
            SqlComponents[] sqlComponents = SqlComponents.values();
            while (versionsIterator.hasNext()) {
                String fromDbVersion = versionsIterator.next().getMainVersion().replace(".", "");
                if (!versionsIterator.hasNext()) {
                    break;
                }

                String toDbVersion = versionsIterator.next().getMainVersion().replace(".", "");
                // We go one step back for the next from -> to
                versionsIterator.previous();

                for (SqlComponents sqlComponent : sqlComponents) {
                    String componentDbFile = upgradeFileFormat.formatted(sqlComponent.dbFolder(), databaseName, fromDbVersion, toDbVersion,
                            sqlComponent.name());
                    try (InputStream componentDbStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream(componentDbFile)) {
                        if (componentDbStream != null) {
                            IOUtils.copy(componentDbStream, outputStream);
                            outputStream.write("\n\n".getBytes());
                        }
                    }

                    String componentAllFile = upgradeFileFormat.formatted(sqlComponent.dbFolder(), "all", fromDbVersion, toDbVersion, sqlComponent.name());
                    try (InputStream componentAllStream = CopyManualSqlFromJarGenerator.class.getClassLoader().getResourceAsStream(componentAllFile)) {
                        if (componentAllStream != null) {
                            IOUtils.copy(componentAllStream, outputStream);
                            outputStream.write("\n\n".getBytes());
                        }
                    }
                }
            }

        }

    }

    protected static BufferedOutputStream createAppendableStream(File destination) throws Exception {
        return new BufferedOutputStream(new FileOutputStream(destination, true));
    }

    public enum SqlComponents {
        common("org/flowable/common/db"),
        engine("org/flowable/db"),
        history("org/flowable/db"),
        app("org/flowable/app/db"),
        cmmn("org/flowable/cmmn/db"),
        dmn("org/flowable/dmn/db"),
        eventregistry("org/flowable/eventregistry/db"),
        identity("org/flowable/idm/db");

        private final String dbFolder;

        SqlComponents(String dbFolder) {
            this.dbFolder = dbFolder;
        }

        public String dbFolder() {
            return dbFolder;
        }

        public String createSqlFile(String databaseName) {
            return dbFolder + "/create/flowable.%s.create.%s.sql".formatted(databaseName, name());
        }
    }

}
