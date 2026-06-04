const { ref, computed } = Vue;

export function useCart() {
    const cartItems = ref(JSON.parse(sessionStorage.getItem("cartItems") || "[]"));

    const addToCart = (product) => {

        const existingItem = cartItems.value.find(item => item.id === product.id);

        if (existingItem) {

            existingItem.quantity += 1;
        } else {

            cartItems.value.push({
                id: product.id,
                name: product.name,
                price: product.price,
                img: product.img,
                quantity: 1,
                selected: true
            });
        }

        sessionStorage.setItem("cartItems", JSON.stringify(cartItems.value));
    };

    const subtotal = computed(() => {
        return cartItems.value
            .filter(item => item.selected)
            .reduce((sum, item) => sum + (item.price * item.quantity), 0);
    });

    const shippingFee = computed(() => (subtotal.value > 0 && subtotal.value < 2000) ? 60 : 0);
    const finalTotal = computed(() => subtotal.value + shippingFee.value);

    const handleDelete = (id, index) => {
       
        setTimeout(() => {   
            cartItems.value = cartItems.value.filter(item => item.id !== id);
            sessionStorage.setItem("cartItems", JSON.stringify(cartItems.value));
        }, 550);
    };

  
    const processCheckout = () => {
        
        const itemsToBuy = cartItems.value.filter(item => item.selected);
        
        if (itemsToBuy.length === 0) {
            alert("您的購物車目前沒有勾選任何商品喔！");
            return false;
        }

        sessionStorage.setItem("latestReceipt", JSON.stringify(itemsToBuy));

        cartItems.value = cartItems.value.filter(item => !item.selected);
        sessionStorage.setItem("cartItems", JSON.stringify(cartItems.value));

        return true;
    };

    return { cartItems, subtotal, shippingFee, finalTotal, addToCart, handleDelete, processCheckout };

}