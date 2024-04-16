@EndUserText.label: 'Booking Projection view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZAP_CDS_PROJ_BOOKING as projection on ZAP_CDS_BOOKING as Booking
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Booking ID'
      BookingID,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier', element: 'AirlineID' }}]
      @ObjectModel.text.element: ['CarrierName']
      CarrierID,
      _Carrier.Name      as CarrierName,
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                                           additionalBinding: [ { localElement: 'CarrierID',    element: 'AirlineID' },
                                                                { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT},
                                                                { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT },
                                                                { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,
      LocalLastChangedAt,
 
      /* associations */
      _Travel : redirected to parent ZAP_CDS_PROJ_TRAVEL,
      _Customer,
      _Carrier,
      _Connection,
      _Flight
 
}
