// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.repay.wallet.domain;

import com.repay.wallet.domain.WalletType;
import com.repay.wallet.domain.WalletTypeDataOnDemand;
import com.repay.wallet.domain.WalletTypeIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect WalletTypeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: WalletTypeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: WalletTypeIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: WalletTypeIntegrationTest: @Transactional;
    
    @Autowired
    WalletTypeDataOnDemand WalletTypeIntegrationTest.dod;
    
    @Test
    public void WalletTypeIntegrationTest.testCountWalletTypes() {
        Assert.assertNotNull("Data on demand for 'WalletType' failed to initialize correctly", dod.getRandomWalletType());
        long count = WalletType.countWalletTypes();
        Assert.assertTrue("Counter for 'WalletType' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void WalletTypeIntegrationTest.testFindWalletType() {
        WalletType obj = dod.getRandomWalletType();
        Assert.assertNotNull("Data on demand for 'WalletType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'WalletType' failed to provide an identifier", id);
        obj = WalletType.findWalletType(id);
        Assert.assertNotNull("Find method for 'WalletType' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'WalletType' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void WalletTypeIntegrationTest.testFindAllWalletTypes() {
        Assert.assertNotNull("Data on demand for 'WalletType' failed to initialize correctly", dod.getRandomWalletType());
        long count = WalletType.countWalletTypes();
        Assert.assertTrue("Too expensive to perform a find all test for 'WalletType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<WalletType> result = WalletType.findAllWalletTypes();
        Assert.assertNotNull("Find all method for 'WalletType' illegally returned null", result);
        Assert.assertTrue("Find all method for 'WalletType' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void WalletTypeIntegrationTest.testFindWalletTypeEntries() {
        Assert.assertNotNull("Data on demand for 'WalletType' failed to initialize correctly", dod.getRandomWalletType());
        long count = WalletType.countWalletTypes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<WalletType> result = WalletType.findWalletTypeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'WalletType' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'WalletType' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void WalletTypeIntegrationTest.testFlush() {
        WalletType obj = dod.getRandomWalletType();
        Assert.assertNotNull("Data on demand for 'WalletType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'WalletType' failed to provide an identifier", id);
        obj = WalletType.findWalletType(id);
        Assert.assertNotNull("Find method for 'WalletType' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyWalletType(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'WalletType' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void WalletTypeIntegrationTest.testMergeUpdate() {
        WalletType obj = dod.getRandomWalletType();
        Assert.assertNotNull("Data on demand for 'WalletType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'WalletType' failed to provide an identifier", id);
        obj = WalletType.findWalletType(id);
        boolean modified =  dod.modifyWalletType(obj);
        Integer currentVersion = obj.getVersion();
        WalletType merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'WalletType' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void WalletTypeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'WalletType' failed to initialize correctly", dod.getRandomWalletType());
        WalletType obj = dod.getNewTransientWalletType(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'WalletType' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'WalletType' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'WalletType' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void WalletTypeIntegrationTest.testRemove() {
        WalletType obj = dod.getRandomWalletType();
        Assert.assertNotNull("Data on demand for 'WalletType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'WalletType' failed to provide an identifier", id);
        obj = WalletType.findWalletType(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'WalletType' with identifier '" + id + "'", WalletType.findWalletType(id));
    }
    
}
