package main

import (
	"fmt"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
	//"log"
)

func main() {
	plugin.Server(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
}

func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider{
		ResourceMap:   map[string]*schema.Resource{
			"terratowns_home": Resource(),
		},
		DataSourceMap: map[string]*schema.Resource{

		},
		Schema: map[string]*schema.Resource{
			"endpoint": {
				Type:        schema.TypeString,
				Required:    true,
				Description: "The endpoint for the external service",
			},
			"token": {
				Type:      schema.TypeString,
				Sensitive: true, // make the token as sensitive to hide the data in the logs
				Required:  true,
			},
			"user_uuid": {
				Type:         schema.TypeString,
				Required:     true,
				Description:  "UUID for configuration",
				ValidateFunc: validateUUID,
			},
		},
	}
	//p.ConfigureContextFunc = providerConfigure(p)
	return p
}

//func validateUUID(v interface{}, k string) (ws []string, errors []error) {
//	log.Print("validateUUID:start")
//	value := v.(string)
//	if _, err = uuid.Parse(value); err != nil {
//		errors = append(error, fmt.Errof("invalid UUID format"))
//	}
//	log.Print("validateUUID:end")
//	return
//
