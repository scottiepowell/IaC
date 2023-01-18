
resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaao6x7uwzfuasfh5ia5qz4zhw4j7oxl6hkhxq4vc7vdqchyxde3una"
    description = "Compartment for Simple infra created by terraform."
    name = "tf-simple-infra"
}
