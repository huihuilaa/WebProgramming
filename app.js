import { useAuth } from './modules/auth.js';
import { useCart } from './modules/cart.js';
import { useProducts } from './modules/products.js';

const { createApp, ref, onMounted, computed } = Vue;

createApp({
    delimiters: ['[[', ']]'],
    setup() {
        const profile = ref({ name: '', email: '', address: '', phone: '' });
        const activeTab = ref('orders');

        const { allProducts, currentProduct, loadProductFromURL } = useProducts(); 
        const { cartItems, subtotal, shippingFee, finalTotal, addToCart, handleDelete, processCheckout } = useCart();
        const { isLoggedIn, loginForm, registerForm, handleRegister, handleLogin, handleLogout } = useAuth(profile);

        const receiptItems = ref([]);
        const generatedOrderId = ref('');

        onMounted(() => {
            loadProductFromURL(); 
            
            const receiptData = sessionStorage.getItem("latestReceipt");
            if (receiptData) {
                receiptItems.value = JSON.parse(receiptData);
                const urlParams = new URLSearchParams(window.location.search);
                generatedOrderId.value = urlParams.get('orderId') || '000000';
            }
        });

        const orderList = ref([
            { id: '#000001', rawId: '000001', status: '運送中', total: '1,200', items: [{ name: 'JOJIIPEN', qty: 1, price: 600 }, { name: 'ヒメヒナダイカットステッカーセット', qty: 2, price: 300 }] },
            { id: '#000002', rawId: '000002', status: '已付款', total: '1,850', items: [{ name: 'バブサマーT ver.WORLD', qty: 2, price: 800 }] },
            { id: '#000003', rawId: '000003', status: '已完成', total: '600', items: [{ name: 'バブサマー降臨タオル ver.WORLD', qty: 1, price: 600 }] }
        ]);

        const toggleDetails = (orderId) => { 
            $(`#details-${orderId.replace('#', '')}`).slideToggle(250); 
        };
        
        const triggerAddToCart = () => {
            const chosenQty = parseInt($('.qty-input').val()) || 1;

            for (let i = 0; i < chosenQty; i++) {
                addToCart(currentProduct.value);
            }

            const toastHtml = `
                <div class="toast-message">
                    <span>🛒 成功將 ${chosenQty} 件 <span class="toast-goods-name">${currentProduct.value.name}</span> 加入購物車！</span>
                </div>
            `;

            const $toast = $(toastHtml).appendTo('#toast-container');

            setTimeout(() => { $toast.addClass('show'); }, 50);

            setTimeout(() => {
                $toast.removeClass('show').css('opacity', '0');
                setTimeout(() => { $toast.remove(); }, 400);
            }, 2500);

            $('.qty-input').val(1);
        };

        const handleCheckoutClick = () => {
            const success = processCheckout();
            if (success) {
                const randomId = Math.floor(100000 + Math.random() * 900000);
                window.location.href = `checkout-success.jsp?orderId=${randomId}`;
            }
        };

        const receiptSubtotal = computed(() => receiptItems.value.reduce((sum, item) => sum + (item.price * item.quantity), 0));
        const receiptShipping = computed(() => (receiptSubtotal.value > 0 && receiptSubtotal.value < 2000) ? 60 : 0);
        const receiptTotal = computed(() => receiptSubtotal.value + receiptShipping.value);
        
        const saveProfile = () => {
            sessionStorage.setItem("profile_" + sessionStorage.getItem("currentUserEmail"), JSON.stringify(profile.value));
            alert('個人資料已成功儲存！');
        };

        const goToDetail = (prodId) => {
            window.location.href = `product-detail.jsp?id=${prodId}`;
        };

        return {
            profile, activeTab, allProducts, currentProduct, cartItems, subtotal, shippingFee, finalTotal, orderList, 
            isLoggedIn, loginForm, registerForm, receiptItems, generatedOrderId, receiptSubtotal, receiptShipping, receiptTotal,
            handleDelete, handleLogin, handleRegister, saveProfile, handleLogout, toggleDetails, triggerAddToCart, goToDetail, handleCheckoutClick
        };
    }
}).mount('#app');