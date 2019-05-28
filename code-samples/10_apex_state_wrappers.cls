/* DataServiceCtrl.cls - VERSION ONE - Wrapper Class */
@AuraEnabled (cacheable=true)
public static Data getAccountOptions() {

  Data valueLabels = new Data();

  List<AggregateResult> aggList = new List<AggregateResult>([
    SELECT AccountId accId, Account.Name accName
    FROM Contact
    GROUP BY AccountId, Account.Name
    HAVING count(Name) > 0
    ORDER BY count(Name) DESC
    LIMIT 10
  ]);

  for (AggregateResult ar : aggList) {
    String accountId = (String)ar.get('accId');
    String accountName = (String)ar.get('accName')
    valueLabels.items.add(
      new Item(accountId, accountName)
    );
  }

  return valueLabels;
}

public class Data {
  @AuraEnabled public List<Item> items;
  public Data() {
    this.items = new List<Item>();
  }
}

public class Item {
  @AuraEnabled public String value;
  @AuraEnabled public String label;
  public Item(String value, String label) {
    this.value = value;
    this.label = label;
  }
}