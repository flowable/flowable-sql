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

import org.flowable.app.engine.AppEngineConfiguration;
import org.flowable.app.engine.impl.db.AppDbSchemaManager;
import org.flowable.cmmn.engine.CmmnEngineConfiguration;
import org.flowable.cmmn.engine.impl.db.CmmnDbSchemaManager;
import org.flowable.common.sql.SqlScriptUtil;
import org.flowable.content.engine.ContentEngineConfiguration;
import org.flowable.content.engine.impl.db.ContentDbSchemaManager;
import org.flowable.dmn.engine.DmnEngineConfiguration;
import org.flowable.dmn.engine.impl.db.DmnDbSchemaManager;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.eventregistry.impl.EventRegistryEngineConfiguration;
import org.flowable.eventregistry.impl.db.EventDbSchemaManager;
import org.flowable.form.engine.FormEngineConfiguration;
import org.flowable.form.engine.impl.db.FormDbSchemaManager;

import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.database.DatabaseConnection;
import liquibase.database.DatabaseFactory;
import liquibase.resource.ClassLoaderResourceAccessor;

public class SqlGenerator {

    public static void main(String[] args) throws Exception {
    	String oldVersion = args[0];
    	String newVersion = args[1];
    	
    	generateAppEngineUpgradeSql(oldVersion, newVersion);
    	generateCmmnEngineUpgradeSql(oldVersion, newVersion);
    	generateEventRegistryEngineUpgradeSql(oldVersion, newVersion);
    	generateDmnEngineUpgradeSql(oldVersion, newVersion);
    	generateFormEngineUpgradeSql(oldVersion, newVersion);
    	generateContentEngineUpgradeSql(oldVersion, newVersion);
    }
    
    protected static void generateAppEngineUpgradeSql(String oldVersion, String newVersion) throws Exception {
    	Database database = getDatabaseInstance();
    	database.setDatabaseChangeLogTableName(AppEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogTableName());
        database.setDatabaseChangeLogLockTableName(AppEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogLockTableName());
    	Liquibase liquibase = new Liquibase(AppDbSchemaManager.LIQUIBASE_CHANGELOG, new ClassLoaderResourceAccessor(), database);
    	SqlScriptUtil.generateUpgradeSqlFile(liquibase, database, oldVersion + ".to." + newVersion, "app");
    }
    
    protected static void generateCmmnEngineUpgradeSql(String oldVersion, String newVersion) throws Exception {
    	Database database = getDatabaseInstance();
    	database.setDatabaseChangeLogTableName(CmmnEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogTableName());
        database.setDatabaseChangeLogLockTableName(CmmnEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogLockTableName());
    	Liquibase liquibase = new Liquibase(CmmnDbSchemaManager.LIQUIBASE_CHANGELOG, new ClassLoaderResourceAccessor(), database);
    	SqlScriptUtil.generateUpgradeSqlFile(liquibase, database, oldVersion + ".to." + newVersion, "cmmn");
    }
    
    protected static void generateEventRegistryEngineUpgradeSql(String oldVersion, String newVersion) throws Exception {
    	Database database = getDatabaseInstance();
    	database.setDatabaseChangeLogTableName(EventRegistryEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogTableName());
        database.setDatabaseChangeLogLockTableName(EventRegistryEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogLockTableName());
    	Liquibase liquibase = new Liquibase(EventDbSchemaManager.LIQUIBASE_CHANGELOG, new ClassLoaderResourceAccessor(), database);
    	SqlScriptUtil.generateUpgradeSqlFile(liquibase, database, oldVersion + ".to." + newVersion, "eventregistry");
    }
    
    protected static void generateDmnEngineUpgradeSql(String oldVersion, String newVersion) throws Exception {
    	Database database = getDatabaseInstance();
    	database.setDatabaseChangeLogTableName(DmnEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogTableName());
        database.setDatabaseChangeLogLockTableName(DmnEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogLockTableName());
    	Liquibase liquibase = new Liquibase(DmnDbSchemaManager.LIQUIBASE_CHANGELOG, new ClassLoaderResourceAccessor(), database);
    	SqlScriptUtil.generateUpgradeSqlFile(liquibase, database, oldVersion + ".to." + newVersion, "dmn");
    }
    
    protected static void generateFormEngineUpgradeSql(String oldVersion, String newVersion) throws Exception {
    	Database database = getDatabaseInstance();
    	database.setDatabaseChangeLogTableName(FormEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogTableName());
        database.setDatabaseChangeLogLockTableName(FormEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogLockTableName());
    	Liquibase liquibase = new Liquibase(FormDbSchemaManager.LIQUIBASE_CHANGELOG, new ClassLoaderResourceAccessor(), database);
    	SqlScriptUtil.generateUpgradeSqlFile(liquibase, database, oldVersion + ".to." + newVersion, "form");
    }
    
    protected static void generateContentEngineUpgradeSql(String oldVersion, String newVersion) throws Exception {
    	Database database = getDatabaseInstance();
    	database.setDatabaseChangeLogTableName(ContentEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogTableName());
        database.setDatabaseChangeLogLockTableName(ContentEngineConfiguration.LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogLockTableName());
    	Liquibase liquibase = new Liquibase(ContentDbSchemaManager.LIQUIBASE_CHANGELOG, new ClassLoaderResourceAccessor(), database);
    	SqlScriptUtil.generateUpgradeSqlFile(liquibase, database, oldVersion + ".to." + newVersion, "content");
    }
    
    protected static Database getDatabaseInstance() throws Exception {
    	ProcessEngineConfiguration engineConfiguration = ProcessEngineConfiguration.createProcessEngineConfigurationFromResource("flowable.cfg.xml");
    	DatabaseFactory databaseFactory = DatabaseFactory.getInstance();
    	DatabaseConnection connection = databaseFactory.openConnection(engineConfiguration.getJdbcUrl(), engineConfiguration.getJdbcUsername(), 
    			engineConfiguration.getJdbcPassword(), engineConfiguration.getJdbcDriver(), null, null, null, new ClassLoaderResourceAccessor());
        return DatabaseFactory.getInstance().findCorrectDatabaseImplementation(connection);
    }

}
