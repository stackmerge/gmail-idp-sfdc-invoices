%dw 2.0
output application/java

var fields = payload.pages[0].fields default {}

---
[
  {
    Name: payload.documentName default "Unknown Document",
    Invoice_Number__c: fields.invoiceNumber.value default "",
    Invoice_Date__c:
        if (fields.invoiceDate.value?)
            (fields.invoiceDate.value as Date {format: "dd-MMM-yyyy"})
        else
            null,
    Purchase_Order__c:
        fields.purchaseOrderNumber.value default ""
  }
]