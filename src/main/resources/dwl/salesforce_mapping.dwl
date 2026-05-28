%dw 2.0
output application/java
---
[
  {
    Name: payload.documentName default "Unknown Document",
    Invoice_Number__c: payload.fields.invoice_number.value default "",
    Invoice_Date__c:
        payload.fields.invoice_date.value,
    Purchase_Order__c:
        payload.fields.po_number.value default ""
  }
]
