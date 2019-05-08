# SmartCity.Registry
[https://smartcolumbus_os.hexdocs.pm/smart_city_registry](https://smartcolumbus_os.hexdocs.pm/smart_city_registry/api-reference.html)

#### Dataset

```javascript
const Dataset = {
    "id": "",                  // UUID
    "business": {              // Project Open Data Metadata Schema v1.1
        "dataTitle": "",       // user friendly (dataTitle)
        "description": "",
        "keywords": [""],
        "modifiedDate": "",
        "orgTitle": "",        // user friendly (orgTitle)
        "contactName": "",
        "contactEmail": "",
        "license": "",
        "rights": "",
        "homepage": "",
        "spatial": "",
        "temporal": "",
        "publishFrequency": "",
        "conformsToUri": "",
        "describedByUrl": "",
        "describedByMimeType": "",
        "parentDataset": "",
        "issuedDate": "",
        "language": "",
        "referenceUrls": [""],
        "categories": [""]
    },
    "technical": {
        "dataName": "",        // ~r/[a-zA-Z_]+$/
        "orgId": "",
        "orgName": "",         // ~r/[a-zA-Z_]+$/
        "systemName": "",      // ${orgName}__${dataName},
        "schema": [
            {
                "name": "",
                "type": "",
                "description": ""
            }
        ],
        "sourceUrl": "",
        "sourceFormat": "",
        "sourceType": "",     // remote|stream|batch
        "cadence": "",
        "queryParams": {
            "key1": "",
            "key2": ""
        },
        "transformations": [], // ?
        "validations": [],     // ?
        "headers": {
            "header1": "",
            "header2": ""
        }
    },
    "_metadata": {
        "intendedUse": [],
        "expectedBenefit": []
    }
}
```

#### Organization

```javascript
const Organization = {
    "id": "",          // uuid
    "orgTitle": "",    // user friendly
    "orgName": "",     // system friendly
    "description": "",
    "logoUrl": "",
    "homepage": "",
    "dn": ""           // LDAP distinguished name
}
```

## Installation

Add the following to your mix.exs dependencies:

```elixir
{:smart_city_registry, "~> 2.6.4", organization: "smartcolumbus_os"}
```

## Contributing

Make your changes and run `docker build .`. This is exactly what our CI will do. The build process runs these commands:

```bash
mix deps.get
mix test
mix format --check-formatted
mix credo
```
