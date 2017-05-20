// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.repay.wallet.domain;

import com.repay.wallet.domain.Wallet;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Wallet_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Wallet.entityManager;
    
    public static final List<String> Wallet.fieldNames4OrderClauseFilter = java.util.Arrays.asList("walletId", "userId", "walletTypeId", "currency", "balance", "isActive", "createdBy", "createdOn", "modifiedBy", "modifiedOn");
    
    public static final EntityManager Wallet.entityManager() {
        EntityManager em = new Wallet().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Wallet.countWallets() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Wallet o", Long.class).getSingleResult();
    }
    
    public static List<Wallet> Wallet.findAllWallets() {
        return entityManager().createQuery("SELECT o FROM Wallet o", Wallet.class).getResultList();
    }
    
    public static List<Wallet> Wallet.findAllWallets(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Wallet o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Wallet.class).getResultList();
    }
    
    public static Wallet Wallet.findWallet(Long id) {
        if (id == null) return null;
        return entityManager().find(Wallet.class, id);
    }
    
    public static List<Wallet> Wallet.findWalletEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Wallet o", Wallet.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Wallet> Wallet.findWalletEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Wallet o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Wallet.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Wallet.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Wallet.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Wallet attached = Wallet.findWallet(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Wallet.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Wallet.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Wallet Wallet.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Wallet merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}