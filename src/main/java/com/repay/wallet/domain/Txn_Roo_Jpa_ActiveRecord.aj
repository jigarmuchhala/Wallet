// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.repay.wallet.domain;

import com.repay.wallet.domain.Txn;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Txn_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Txn.entityManager;
    
    public static final List<String> Txn.fieldNames4OrderClauseFilter = java.util.Arrays.asList("userId", "walletId", "txnTypeId", "txnId", "senderAccountNumber", "receiverAccountNumber", "currency", "details", "txnAmount", "taxValue", "taxAmount", "taxCurrency", "status", "createdBy", "modifieldBy", "createdOn", "modifiedOn", "comments");
    
    public static final EntityManager Txn.entityManager() {
        EntityManager em = new Txn().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Txn.countTxns() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Txn o", Long.class).getSingleResult();
    }
    
    public static List<Txn> Txn.findAllTxns() {
        return entityManager().createQuery("SELECT o FROM Txn o", Txn.class).getResultList();
    }
    
    public static List<Txn> Txn.findAllTxns(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Txn o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Txn.class).getResultList();
    }
    
    public static Txn Txn.findTxn(Long id) {
        if (id == null) return null;
        return entityManager().find(Txn.class, id);
    }
    
    public static List<Txn> Txn.findTxnEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Txn o", Txn.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Txn> Txn.findTxnEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Txn o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Txn.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Txn.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Txn.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Txn attached = Txn.findTxn(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Txn.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Txn.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Txn Txn.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Txn merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}