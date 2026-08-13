/*
 *
 * This interface should be implemented by all trigger handlers. Please read carefully the description
 * of each method. The purpose of interface is to provide common implementation pattern to all triggers
 * and to guide bulkified easily maintainable implementation of triggers
 *
 */
public interface TriggerHandlerInterface {
  /**
   * This method is called prior to execution of a ALL BEFORE trigger operations . Use this to cache
   * any data required into maps prior execution of the trigger.
   *
   * This has to be bulk compatible and all soql should be executed within this method.
   */
  void bulkBefore();

  /**
   * This method is called prior to execution of a BEFORE INSERT trigger. Use this to cache
   * any data required into maps prior execution of the trigger.
   *
   * This has to be bulk compatible and all soql should be executed within this method.
   */

  void bulkBeforeInsert();

  /**
   * This method is called prior to execution of a BEFORE UPDATE trigger. Use this to cache
   * any data required into maps prior execution of the trigger.
   *
   * This has to be bulk compatible and all soql should be executed within this method.
   */

  void bulkBeforeUpdate();

  /**
   * This method is called prior to execution of a AFTER trigger. Use this to cache
   * any data required into maps prior execution of the trigger.
   *
   * This has to be bulk compatible and all soql should be executed within this method.
   */
  void bulkAfter();

  /**
   * This method is called prior to execution of a AFTER INSERT trigger. Use this to cache
   * any data required into maps prior execution of the trigger.
   *
   * This has to be bulk compatible and all soql should be executed within this method.
   */

  void bulkAfterInsert();

  /**
   * This method is called prior to execution of a AFTER UPDATE trigger. Use this to cache
   * any data required into maps prior execution of the trigger.
   *
   * This has to be bulk compatible and all soql should be executed within this method.
   */

  void bulkAfterUpdate();

  /*
   * Called iteartively before insert. No DML or SOQL should be added to this method
   */
  void beforeInsert(Sobject newObj);

  /*
   * Called iteratively before update. No DML or SOQL should be added to this method
   */
  void beforeUpdate(Sobject newObj, Sobject oldObj);

  /*
   * Called iteratively before delete. No DML or SOQL should be added to this method
   */
  void beforeDelete(Sobject oldObj);

  /*
   * Called iteartively after insert. No DML or SOQL should be added to this method
   */
  void afterInsert(Sobject newObj);

  /*
   * Called iteartively after update. No DML or SOQL should be added to this method
   */
  void afterUpdate(Sobject newObj, Sobject oldObj);

  /*
   * Called iteartively after delete. No DML or SOQL should be added to this method
   */
  void afterDelete(Sobject oldObj);

  /*
   * This method is called after the trigger execution. All DML and asynchronous method calls
   * should be added here and it should be bulk compatible. Please avoid unneessary DML calls
   * by making only DML statements needed (data actually exists)
   */
  void postProcess();

  /*
   * This method is called after the trigger execution. All DML and asynchronous method calls
   * should be added here. It allows to make a call directly the procees needed. No need to have an additional check for before, after, insert, update operations. Please avoid unneessary DML calls
   * by making only DML statements needed (data actually exists)
   */

  void postProcessBeforeInsert();

  /*
   * This method is called after the trigger execution. All DML and asynchronous method calls
   * should be added here. It allows to make a call directly the procees needed. No need to have an additional check for before, after, insert, update operations. Please avoid unneessary DML calls
   * by making only DML statements needed (data actually exists)
   */

  void postProcessBeforeUpdate();

  /*
   * This method is called after the trigger execution. All DML and asynchronous method calls
   * should be added here. It allows to make a call directly the procees needed. No need to have an additional check for before, after, insert, update operations. Please avoid unneessary DML calls
   * by making only DML statements needed (data actually exists)
   */
  void postProcessBeforeDelete();

  /*
   * This method is called after the trigger execution. All DML and asynchronous method calls
   * should be added here. It allows to make a call directly the procees needed. No need to have an additional check for before, after, insert, update operations. Please avoid unneessary DML calls
   * by making only DML statements needed (data actually exists)
   */

  void postProcessAfterInsert();

  /*
   * This method is called after the trigger execution. All DML and asynchronous method calls
   * should be added here. It allows to make a call directly the procees needed. No need to have an additional check for before, after, insert, update operations. Please avoid unneessary DML calls
   * by making only DML statements needed (data actually exists)
   */
  void postProcessAfterUpdate();


  /*
   * This method is called after the trigger execution. All DML and asynchronous method calls
   * should be added here. It allows to make a call directly the procees needed. No need to have an additional check for before, after, insert, update operations. Please avoid unneessary DML calls
   * by making only DML statements needed (data actually exists)
   */
  void postProcessAfterDelete();
    

}