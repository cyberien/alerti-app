<?php
/**
 * Auth0 plugin for Craft CMS 3.x
 *
 * Use Auth0 with Craft.
 *
 * @link      https://angell.io
 * @copyright Copyright (c) 2020 Angell & Co
 */

/**
 * Auth0 config.php
 *
 * This file exists only as a template for the Auth0 settings.
 * It does nothing on its own.
 *
 * Don't edit this file, instead copy it to 'craft/config' as 'auth0.php'
 * and make your changes there to override default settings.
 *
 * Once copied to 'craft/config', this file will be multi-environment aware as
 * well, so you can have different settings groups for each environment, just as
 * you do for 'general.php'
 */

return [
    'domain' => 'alerti2021.eu.auth0.com',
    'clientId' => 'NsA4MQ7Lqe2WiIUKu1nbJBtKcOXJv5Oy',
    'clientSecret' => 'HTft0v0ZEq1j53BtEz-bVMFdWAuY80R03MwRGSagdBWpqLIAkuaB0VGy0Mqj95JB',
    'callbackUrl' => 'https://my.alerti.app/actions/auth0/auth/callback',
    'userGroupHandle' => null,
    'logoutReturnUrl' => 'https://my.alerti.app',
    'uniqueUserFieldHandle' => null,
    'uniqueUserFieldMetaKey' => null
];
