const { ref, onMounted } = Vue;

export function useAuth(profile) {
    const isLoggedIn = ref(sessionStorage.getItem("isLoggedIn") === "true");
    const loginForm = ref({ email: '', password: '' });
    const registerForm = ref({ email: '', password: '' });

     onMounted(() => {
         const currentPage = window.location.pathname.split("/").pop();
         const checkLogin = sessionStorage.getItem("isLoggedIn") === "true";
        
         if (currentPage === "profile.jsp") {
             if (!checkLogin) {
                 alert("請先登入會員！");
                 window.location.href = "login.jsp";
                 return;
             }
             const currentEmail = sessionStorage.getItem("currentUserEmail");
             const savedProfile = sessionStorage.getItem("profile_" + currentEmail);
             if (savedProfile) { 
                 profile.value = JSON.parse(savedProfile); 
             } else { 
                 profile.value.email = currentEmail; 
             }
         }
     });

    const handleRegister = () => {
        if (registerForm.value.email && registerForm.value.password) {
            const allUsers = JSON.parse(sessionStorage.getItem("allUsers") || "{}");
            if (allUsers[registerForm.value.email]) { 
                alert('該信箱已被註冊！'); 
                return; 
            }
            allUsers[registerForm.value.email] = registerForm.value.password;
            sessionStorage.setItem("allUsers", JSON.stringify(allUsers));
            sessionStorage.setItem("profile_" + registerForm.value.email, JSON.stringify({ name: '', email: registerForm.value.email, address: '', phone: '' }));
            alert('註冊成功！請登入！');
            window.location.href = "login.jsp";
        }
    };

    const handleLogin = () => {
        if (loginForm.value.email && loginForm.value.password) {
            const allUsers = JSON.parse(sessionStorage.getItem("allUsers") || "{}");
            const savedPassword = allUsers[loginForm.value.email];
            
            if (!savedPassword) { 
                alert('該帳號尚未註冊！'); 
                window.location.href = "register.jsp"; 
                return; 
            }
            
            if (loginForm.value.password === savedPassword) {
                alert('登入成功！');
                sessionStorage.setItem("isLoggedIn", "true");
                sessionStorage.setItem("currentUserEmail", loginForm.value.email);
                isLoggedIn.value = true;
                window.location.href = "profile.jsp";
            } else { 
                alert('密碼錯誤！'); 
            }
        }
    };

    const handleLogout = () => {
        if (confirm("確定要登出嗎？")) {
            sessionStorage.removeItem("isLoggedIn");
            sessionStorage.removeItem("currentUserEmail");
            isLoggedIn.value = false;
            window.location.href = "login.jsp";
        }
    };

    return { isLoggedIn, loginForm, registerForm, handleRegister, handleLogin, handleLogout };
}