# Lift and shift to DB2 on Cloud
We are presenting the process to lift and shift the Inventory database to DB2 hosted service on IBM Cloud.

## Create a DB2 on Cloud instance
Once logged to the IBM Cloud console, you can add a database resource and select DB2.

![](db2-oc-catalog.png)

Select the region, space, configuration (HA) and the pricing plans to support your storage needs and performance requirements.

![](db2-oc-creation.png)

The created service is now listed in the `Cloud Foundry Services` in the Console Dashboard. From there you can select the service to reach its home page, where you can define the new credentials used for remote connection:

![](db2-oc-credentials.png)

Once you have the connection, use your Java development environment to create a connection to the database. Here is an example of using Eclipse - Database Development perspective with the following settings:

![](eclipse-oc-cx.png)

Now we are ready to use other tools to do the migration.

## Migrate  
