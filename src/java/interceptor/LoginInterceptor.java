/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.Interceptor;
import entity.User;
import java.util.Map;

public class LoginInterceptor extends AbstractInterceptor {
    
    public LoginInterceptor() {
    }

    
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map<String, Object> session = actionInvocation.getInvocationContext().getSession();
        
        User current_user = (User) session.get("current_user");
        if (current_user == null) {
            return Action.LOGIN;
        } else {
            return actionInvocation.invoke();
        }
    }
    
}
