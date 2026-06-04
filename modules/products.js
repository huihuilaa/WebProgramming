const { ref } = Vue;

export function useProducts() {
    const allProducts = ref([
        { id: 1, name: 'ヒメヒナミニぬい ver.ひめ', price: 600, img: './picture/hime-doll.webp' },
        { id: 2, name: 'ヒメヒナミニぬい ver.ひな', price: 600, img: './picture/hina-doll.webp' },
        { id: 3, name: 'ヒメヒナミニぬい ver.ジョジうさ', price: 600, img: './picture/joji-doll.webp' },
        { id: 4, name: 'バブサマーT ver.WORLD', price: 800, img: './picture/bubblin-summer-t-shirt.webp' },
        { id: 5, name: 'バブサマー降臨タオル ver.WORLD', price: 600, img: './picture/bubblin-summer-towel.webp' },
        { id: 6, name: 'ヒメヒナダイカットビジュアルパネル', price: 1100, img: './picture/himehina-virtual-panel.webp' },
        { id: 7, name: 'ヒメヒナアクリルスタンド ver.Cute', price: 350, img: './picture/himehina-acrysta-cute.webp' },
        { id: 8, name: 'ヒメヒナアクリルスタンド ver.Cool', price: 350, img: './picture/himehina-acrysta-cool.webp' },
        { id: 9, name: 'JOJIIPEN', price: 200, img: './picture/jojiipen.webp' },
        { id: 10, name: 'ヒメヒナスタンダード缶バッジ', price: 100, img: './picture/himehina-standard-can-badge.webp' },
        { id: 11, name: 'ヒメヒナアクリルキーホルダー', price: 250, img: './picture/himehina-acrys-keychain.webp' },
        { id: 12, name: 'ヒメヒナダイカットステッカーセット', price: 300, img: './picture/himehina-sticker-set.webp' }
    ]);

    const currentProduct = ref(allProducts.value[0]);

    const loadProductFromURL = () => {
        const urlParams = new URLSearchParams(window.location.search);
        const productId = parseInt(urlParams.get('id'));

        if (productId) {
            const found = allProducts.value.find(p => p.id === productId);
            if (found) {
                currentProduct.value = found;
            }
        }
    };

    return { allProducts, currentProduct, loadProductFromURL };
}