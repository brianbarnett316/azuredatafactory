Ingress ADLS Gen2 JSON Format to Profisee REST API
==================================================

This article describes a solution template that you can use to copy
member data from Azure Data Lake Storage Gen2 JSON storage to Profisee
REST API.

About this solution template
----------------------------

This template copies member data from ADLS Gen2 in JSON format to
Profisee via the REST API. The template is designed to work with a
folder structure consisting of a subfolder for each entity within the
input container. The file name must have the .json extension.

<img src="./media/ingress_1.png" style="width:4.23875in;height:1.96269in" />

<img src="./media/ingress_2.png" style="width:6.5in;height:0.86875in" />

**How to use this solution template**

1.  Go to the **Ingress JSON to Profisee REST API** template.

> <img src="./media/ingress_3.png" style="width:2.8806in;height:2.05224in" />

1.  Create a **New** or use an existing connection to the ADLS Gen2
    source data store that you are copying data from.

> <img src="./media/ingress_4.png" style="width:6.5in;height:3.13333in" />

1.  Create a **New** or use an existing connection to the sink Profisee
    REST API.

> <img src="./media/ingress_5.png" style="width:6.5in;height:3.13333in" />

1.  Select **Use this template**.

> <img src="./media/ingress_6.png" style="width:6.5in;height:3.46597in" />

1.  You will see a pipeline created as shown in the following example:

> <img src="./media/ingress_7.png" style="width:4.33582in;height:4.56883in" />
>
> You should also see the following template validation output.
>
> <img src="./media/ingress_8.png" style="width:3.02985in;height:0.64356in" />
>
> There is one item needed for the pipeline.

1.  **x-api-key:** The Profisee API key, which is the Client Id for the
    user account you are using to connect to the Profisee API. This is
    entered in the Source tab. **Note:** According to Microsoft, this
    will be an option in the Linked Service dialog when creating the
    REST API connection. We will update this documentation at that time.

> <img src="./media/ingress_9.png" style="width:2.96789in;height:3.50613in" />

1.  The pipeline has the following Parameters and Variables

    1.  The FileFolder within the InputBlobJson container.

    2.  The FileName of the file containing the member data in JSON
        format which the Profisee REST Update API expects. Must end in
        .json file extension.

> <img src="./media/ingress_10.png" style="width:4.14925in;height:1.38885in" />

1.  The EntityName.

> <img src="./media/ingress_11.png" style="width:4.19403in;height:1.2376in" />

1.  The **Set EntityName variable** activity will set the **EntityName**
    variable using the FileFolder path. It uses a container name of
    **profisee-input** however you can use a different name. For
    example, a FileFolder path of **profisee-input/product** will result
    in an EntityName of **product**.

> <img src="./media/ingress_12.png" style="width:3.60115in;height:2.4403in" />

1.  The Source dataset properties are set from the two pipeline
    parameters.

> <img src="./media/ingress_13.png" style="width:4.76866in;height:1.68737in" />

1.  The Sink dataset properties are set from the EntityName variable and
    the isUpsert is set to true. You can change it to false if you wish
    to perform an Update instead of an Upsert. The **Request method**
    must be set to **PATCH**.

> <img src="./media/ingress_14.png" style="width:4.58955in;height:2.12855in" />

1.  You can trigger the pipeline manually, but you can also create an
    Event trigger to trigger the pipeline to run any time a new file is
    uploaded to the container.

    1.  Set up your trigger pointing to your input container. Enter the
        **Container name** in this format **/&lt;container name&gt;/**.
        For example: **/profisee-input/**. Click **Continue** when done.
        Note: the Container name must match the input container name
        entered in the **Set EntityName variable** activity above.

> <img src="./media/ingress_15.png" style="width:3.60441in;height:4.8209in" />

1.  Click **Continue** on the **Data preview** page.

> <img src="./media/ingress_16.png" style="width:3.09322in;height:2.55224in" />

1.  Enter the following **Trigger Run Parameters**

> <img src="./media/ingress_17.png" style="width:4.10067in;height:2.79949in" />

1.  Once you are finished with all your changes, click Publish All.

> <img src="./media/ingress_18.png" style="width:1.36994in;height:0.29043in" />

1.  If you added an event trigger, upload a file to an entity folder
    within your input container. The file must contain the members in
    JSON format. An example is shown below.

> <img src="./media/ingress_19.png" style="width:4.37091in;height:2.00273in" />
>
> <img src="./media/ingress_20.png" style="width:2.96026in;height:2.47015in" />

1.  Select **Monitor** tab in the left navigation panel and wait for
    about 20 seconds. Click **Refresh** to get the updated run status.

2.  When the pipeline run completes successfully, you would see results
    like the following example. Notice the pipeline was triggered by the
    event trigger.

> <img src="./media/ingress_21.png" style="width:6.5in;height:1.42014in" />

Sink parameters
---------------

> You can customize the operation by changing **isUpsert** to false.
> When set to false it performs an Update instead of an Upsert.
>
> <img src="./media/ingress_22.png" style="width:4.0698in;height:1.8875in" />

Next steps
----------

-   [Introduction to Azure Data
    Factory](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/data-factory/introduction.md)