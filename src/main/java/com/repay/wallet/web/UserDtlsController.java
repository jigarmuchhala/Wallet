package com.repay.wallet.web;
import com.repay.wallet.domain.UserDtls;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/userdtlses")
@Controller
@RooWebScaffold(path = "userdtlses", formBackingObject = UserDtls.class)
public class UserDtlsController {
}
