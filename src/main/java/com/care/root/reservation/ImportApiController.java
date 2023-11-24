package com.care.root.reservation;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class ImportApiController {

    private IamportClient api;

    public ImportApiController() {
        // REST API Ű�� REST API secret �� �Ʒ�ó�� ������� �Է��Ѵ�.
        
    	this.api = new IamportClient("5732631264858326","2rdQQhIGqlTXbiJ5uxmicBDlxnZCjRfUoCqZrVrf8VsR4o5veOjPFCyCdx6iRdm9jTk4db6IkKsojSR9");
   }
    @ResponseBody
    @RequestMapping("/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session
            , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
    {
    	System.out.println("�����Ϸ�");
        return api.paymentByImpUid(imp_uid);
    }
}