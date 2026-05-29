%dw 2.0
import try from dw::Runtime
output application/java

var fields = payload.pages[0].fields default {}
var rawDate = fields.invoiceDate.value default ""

var normalizedDate = rawDate
    replace /,/ with ""
    replace /-/ with " "

var parsedDate =
    try(() -> normalizedDate as Date {format: "d MMMM yyyy"}).result
    default try(() -> normalizedDate as Date {format: "d MMM yyyy"}).result
    default try(() -> normalizedDate as Date {format: "MMMM d yyyy"}).result
    default null

---
[
  {
    Name: payload.documentName default "Unknown Document",
    Invoice_Number__c: fields.invoiceNumber.value default "",
    Invoice_Date__c: parsedDate,      
    Purchase_Order__c: fields.purchaseOrderNumber.value default ""
  }
]
