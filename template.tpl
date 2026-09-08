___INFO___

{
  "displayName": "Lean Cookie Consent",
  "description": "Loads the Lean Cookie Consent SaaS banner from Google Tag Manager using a Site Key.",
  "categories": ["TAG_MANAGEMENT", "UTILITY", "MARKETING"],
  "securityGroups": [],
  "id": "lean_cookie_consent",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "",
    "displayName": "Lean Cookie Consent",
    "id": "lean_cookie_consent"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "siteKey",
    "displayName": "Site Key",
    "help": "Paste the public Site Key from your Lean Cookie Consent dashboard.",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": ["^[a-z0-9_-]{1,64}$"],
        "errorMessage": "Use only lowercase letters, numbers, underscores and hyphens, max 64 characters."
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "setDefaultDenied",
    "checkboxText": "Set Google Consent Mode default state to denied before loading Lean",
    "simpleValueType": true,
    "defaultValue": true
  },
  {
    "type": "TEXT",
    "name": "waitForUpdate",
    "displayName": "Consent Mode wait_for_update (milliseconds)",
    "help": "How long Google tags should wait for a consent update. Recommended: 500.",
    "simpleValueType": true,
    "defaultValue": "500",
    "valueValidators": [
      {
        "type": "REGEX",
        "args": ["^[0-9]{1,4}$"],
        "errorMessage": "Enter a number from 0 to 9999."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "setDefaultDenied",
        "paramValue": true,
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "debugMode",
    "checkboxText": "Log debug messages in GTM preview mode",
    "simpleValueType": true,
    "defaultValue": false
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const encodeUriComponent = require('encodeUriComponent');
const setDefaultConsentState = require('setDefaultConsentState');
const log = require('logToConsole');

const siteKey = data.siteKey;
const waitForUpdate = data.waitForUpdate || 500;
const scriptUrl = 'https://api.leancookieconsent.com/embed.js?site=' + encodeUriComponent(siteKey);

if (data.setDefaultDenied) {
  setDefaultConsentState({
    ad_storage: 'denied',
    ad_user_data: 'denied',
    ad_personalization: 'denied',
    analytics_storage: 'denied',
    functionality_storage: 'granted',
    personalization_storage: 'denied',
    security_storage: 'granted',
    wait_for_update: waitForUpdate
  });
}

if (data.debugMode) {
  log('Lean Cookie Consent: injecting embed.js for Site Key', siteKey);
}

injectScript(
  scriptUrl,
  data.gtmOnSuccess,
  data.gtmOnFailure,
  'lean-cookie-consent-' + siteKey
);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://api.leancookieconsent.com/embed.js*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_user_data"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_personalization"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "analytics_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "functionality_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "personalization_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "security_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___NOTES___

Lean Cookie Consent GTM template v0.1.0.