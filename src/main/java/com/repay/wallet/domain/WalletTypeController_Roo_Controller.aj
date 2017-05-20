// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.repay.wallet.domain;

import com.repay.wallet.domain.WalletType;
import com.repay.wallet.domain.WalletTypeController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect WalletTypeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String WalletTypeController.create(@Valid WalletType walletType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, walletType);
            return "wallettypes/create";
        }
        uiModel.asMap().clear();
        walletType.persist();
        return "redirect:/wallettypes/" + encodeUrlPathSegment(walletType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String WalletTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new WalletType());
        return "wallettypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String WalletTypeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("wallettype", WalletType.findWalletType(id));
        uiModel.addAttribute("itemId", id);
        return "wallettypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String WalletTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("wallettypes", WalletType.findWalletTypeEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) WalletType.countWalletTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("wallettypes", WalletType.findAllWalletTypes(sortFieldName, sortOrder));
        }
        return "wallettypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String WalletTypeController.update(@Valid WalletType walletType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, walletType);
            return "wallettypes/update";
        }
        uiModel.asMap().clear();
        walletType.merge();
        return "redirect:/wallettypes/" + encodeUrlPathSegment(walletType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String WalletTypeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, WalletType.findWalletType(id));
        return "wallettypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String WalletTypeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        WalletType walletType = WalletType.findWalletType(id);
        walletType.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/wallettypes";
    }
    
    void WalletTypeController.populateEditForm(Model uiModel, WalletType walletType) {
        uiModel.addAttribute("walletType", walletType);
    }
    
    String WalletTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}