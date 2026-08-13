/*
 *
 * Abstract class to be used as a base class for triggers handlers implemented
 * allows triggers to override only the methods actual needed
 */
public virtual class AbstractTriggerHandler implements TriggerHandlerInterface {
  public virtual void bulkBefore() {
  }

  public virtual void bulkBeforeInsert() {
  }

  public virtual void bulkBeforeUpdate() {
  }

  public virtual void bulkAfter() {
  }

  public virtual void bulkAfterInsert() {
  }

  public virtual void bulkAfterUpdate() {
  }

  public virtual void beforeInsert(Sobject newObj) {
  }

  public virtual void beforeUpdate(Sobject newObj, Sobject oldObj) {
  }

  public virtual void beforeDelete(Sobject oldObj) {
  }

  public virtual void afterInsert(Sobject newObj) {
  }

  public virtual void afterUpdate(Sobject newObj, Sobject oldObj) {
  }

  public virtual void afterDelete(Sobject oldObj) {
  }

  public virtual void postProcess() {
  }

  public virtual void postProcessBeforeInsert() {
  }

  public virtual void postProcessBeforeUpdate() {
  }
  
  public virtual void postProcessBeforeDelete() {
  }

  public virtual void postProcessAfterInsert() {
  }

  public virtual void postProcessAfterUpdate() {
  }

  public virtual void postProcessAfterDelete() {
  }

}