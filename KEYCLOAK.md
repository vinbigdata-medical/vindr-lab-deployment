# Some first words

As you can see in the deployment, we provided the default user_name and password are admin/admin. We know it looks insecured but we want to make it as simple as possible so you can update it later in the docker-compose.yaml file. Just don’t forget that is the authentication for the Master realm in Keycloak.

# Entering the system

Enter the Keycloak, go to http://localhost:8080/auth. Normally, the default location for Keycloak is http://localhost:8080/auth, but in this project we use nginx as a gateway, so please do not confuse.

Then click Administration Console, to go to the Master realm login screen.

In the Master realm login screen, use username and password as provided before. In this case, it is admin/admin.

In the Master realm UI, create the vinlab realm for the project by clicking into the drop down menu at the top left corner near the realm's name. Then, click Add realm

<img src="./images/kc_master.png" alt="Master" width="512"/>

Type vinlab then click Create.

<img src="./images/kc_add_realm.png" alt="Add Realm" width="512"/>

Here is the result

<img src="./images/kc_view_realm.png" alt="View Realm" width="512"/>

# Roles

Now, we go ahead to another element of the system: Roles. In the Vinlab, we provided roles as follows: PO, PO_PARTNER, ANNOTATOR, REVIEWER, GUEST.

<img src="./images/kc_view_role.png" alt="View Roles" width="512"/>

To create a new role, go to the Roles function in the left panel, the click Add role to create a new role.

<img src="./images/kc_add_role_2.png" alt="Add Roles" width="512"/>

# Clients

This part is a bit more complicated. Vinlab includes 2 components, vinlab-frontend and vinlab-backend, corresponding to 2 clients.

<img src="./images/kc_view_client.png" alt="View Client" width="512"/>

To create a new OIDC client go to the Clients item at the left menu. On this page you’ll see a Create button on the right.

<img src="./images/kc_add_client.png" alt="View Add Client" width="512"/>

Go to the Scope tab of the vinlab-frontend client, uncheck Full Scope Allowed then assign the above roles

<img src="./images/kc_view_client_2.png" alt="View Client" width="512"/>

It can be considered that the creation of vinlab-frontend is done from here. Now comes the slightly more complicated part, the vinlab-backend client. Similar to the steps above, install vinlab-backend. However, in the client configuration section, you have to change some settings:

- Access Type: from public to confidential
- Turn on Service Accounts Enabled and Authorization Enabled
  Then click Save.

<img src="./images/kc_view_client_3.png" alt="View Client" width="512"/>

There is one more thing to do in this step, for the vinlab-frontend client, go to the Mappers tab then create a new mapper object by clicking Add Builtin button.

<img src="./images/kc_add_client_mapper.png" alt="Add Client" width="512"/>

You will see a new item named realm roles in the list. Click it again then turn on the Add to userinfo toggle and change Token Claim Name to realm_roles

<img src="./images/kc_add_client_mapper_2.png" alt="Add Mapper" width="512"/>

# Authorizing Permissions

Now, here is the interesting part. You will create some of the Authorization rules for the project. Select realm roles from the list then hit Add selected.

## Authorization Scopes

Firstly, we initialize the Authorization Scopes.
Then click the Create button to create a new scope. We have 4 common scopes following the CRUD: create, read, update, delete. After that, we got:

<img src="./images/kc_view_scope_2.png" alt="View Scopes" width="512"/>

## Resources

Secondly, go to Authorization/Resources

Then click the Create button to go to the Add Resource window. Please focus on the fact that we have resources: accounts, annotations, labels, label_groups, projects, tasks, objects, stats, sessions, studies, label_exports because you are going to create all of these. For each type of resources, we provide totally 4 scopes:

<img src="./images/kc_add_resource.png" alt="Add Resources" width="512"/>

After all, here is the result:

<img src="./images/kc_view_resource.png" alt="View Resources" width="512"/>

## Policies

Thirdly, Policies coming. Click the Create Policy… button, select Role in the drop-down list.

<img src="./images/kc_view_policy.png" alt="View Policies" width="512"/>

To create a new policy, it will match with the role of the realm. For example:

<img src="./images/kc_add_policy.png" alt="Add Policies" width="512"/>

After that, we got 5 policies are represented as 5 roles.

<img src="./images/kc_view_policy_2.png" alt="View Policies" width="512"/>

## Permission

Finally, after resource, scope and policies, we create a new Permission.

<img src="./images/kc_view_perms.png" alt="View Permission" width="512"/>

Click the Create Permission… button and select Scope-Based option. For example, we have Create Studies permission. Remember, after Name, Resource, Scope and Apply Policy, set the Decision Strategy to Affirmative.

<img src="./images/kc_add_perms.png" alt="Add Permission" width="512"/>

And final result

<img src="./images/kc_view_perms_2.png" alt="View Permission" width="512"/>

# Users

Now turn to the Users section in the left menu.

<img src="./images/kc_view_user.png" alt="View Users" width="512"/>

Then click Add user button

<img src="./images/kc_add_user.png" alt="Add Users" width="512"/>

Create a new username
Turn to the Credentials tab, set the password you want, make sure you got it and Set Password.

<img src="./images/kc_add_user_pwd.png" alt="Add Users" width="512"/>

Calm down, there is another small step. Go to Role Mappings tab, the assign PO role to this account.

<img src="./images/kc_view_user_role_2.png" alt="View Users" width="512"/>

And here we go!

=========

More information, please visit user guide of <a href="https://www.keycloak.org/docs/latest/server_admin/" target="_top">Keycloak</a>.
