// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.repay.wallet.domain;

import com.repay.wallet.domain.UserDtls;
import com.repay.wallet.domain.Wallet;
import com.repay.wallet.domain.WalletController;
import com.repay.wallet.domain.WalletType;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect WalletController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String WalletController.create(@Valid Wallet wallet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, wallet);
            return "wallets/create";
        }
        uiModel.asMap().clear();
        wallet.persist();
        return "redirect:/wallets/" + encodeUrlPathSegment(wallet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String WalletController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Wallet());
        return "wallets/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String WalletController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("wallet", Wallet.findWallet(id));
        uiModel.addAttribute("itemId", id);
        return "wallets/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String WalletController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("wallets", Wallet.findWalletEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Wallet.countWallets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("wallets", Wallet.findAllWallets(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "wallets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String WalletController.update(@Valid Wallet wallet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, wallet);
            return "wallets/update";
        }
        uiModel.asMap().clear();
        wallet.merge();
        return "redirect:/wallets/" + encodeUrlPathSegment(wallet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String WalletController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Wallet.findWallet(id));
        return "wallets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String WalletController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Wallet wallet = Wallet.findWallet(id);
        wallet.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/wallets";
    }
    
    void WalletController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("wallet_createdon_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("wallet_modifiedon_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void WalletController.populateEditForm(Model uiModel, Wallet wallet) {
        uiModel.addAttribute("wallet", wallet);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("userdtlses", UserDtls.findAllUserDtlses());
        uiModel.addAttribute("wallettypes", WalletType.findAllWalletTypes());
    }
    
    String WalletController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
