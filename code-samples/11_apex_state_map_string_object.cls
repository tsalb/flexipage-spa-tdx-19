/* DataServiceCtrl.cls - VERSION TWO - Map<String, Object> */
@AuraEnabled (cacheable=true)
public static Map<String, Object> getAccountOptionsCache() {

  Map<String, Object> optionsCache = new Map<String, Object>();

  List<AggregateResult> aggList = new List<AggregateResult>([
    SELECT AccountId accId, Account.Name accName
    FROM Contact
    GROUP BY AccountId, Account.Name
    HAVING count(Name) > 0
    ORDER BY count(Name) DESC
    LIMIT 10
  ]);

  List<Map<String, Object>> items = new List<Map<String, Object>>();
  for (AggregateResult ar : aggList) {
    Map<String, Object> option = new Map<String, Object>{
      'value' => (String)ar.get('accId'),
      'label' => (String)ar.get('accName')
    };
    items.add(option);
  }

  optionsCache.put('items', items);

  return optionsCache;
}