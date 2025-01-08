const App = Vue.createApp({
    data() {
        return {
            blacklistedWords: [
                "nigger", "nigga", "digga, kurva", "fasz", "fasszop", "fasszopó", "anyád", "nigg", "cigány"
            ],
            showUI: false,
            selectedPage: "mainmenu",
            isDropdownOpen: true,
            select: "",
            count: 0,
            premadeLoads: [],
            creatorData: {
                loadName: "",
                selectedWep: "",
                selectedItems: [],
                currentWep: 0,
                currentItems: 0,
                maxWep: 1,
                maxItems: 8,
                currentPrice: 0,
                weapons: [
                    {
                        name: "weapon_appistol",
                        price: 1000
                    },
                    {
                        name: "weapon_pistol",
                        price: 2000
                    }
                ],
                items: [
                    {
                        name: "ammo-9",
                        price: 5
                    },
                    {
                        name: "ammo-rifle",
                        price: 5
                    }
                ]
            },
            savedLoads: []
        };
    },
    methods: {
        insert(type, item, amount) {
            if (!type) return;
            if (!item) return;
            let lengths = 0;
            if (type === "weapon") {
                if (this.creatorData.currentWep >= 1) return;
                this.creatorData.currentWep++;
                this.creatorData.selectedWep = item;
                this.creatorData.currentPrice += this.creatorData.weapons.find(x => x.name === item).price;
                this.select = "";
                this.count = 0;
            } else {
                if (!amount || amount < 1) return;

                lengths = this.creatorData.selectedItems.length;
                if (lengths >= this.creatorData.maxItems) return;
                this.creatorData.currentItems++;
                this.creatorData.selectedItems.push({ name: item, count: amount });
                this.creatorData.currentPrice += amount * this.creatorData.items.find(x => x.name === item).price;
                this.select = "";
                this.count = 0;
            }
        },
        deleteFrom(type, index, item, amount) {
            if (!type) return;
            if (!item) return;
            console.log(item)
            // console.log(index, type)
            if (type === "weapon") {
                this.creatorData.currentPrice -= this.creatorData.weapons.find(x => x.name === item).price;

                this.creatorData.currentWep--;
                this.creatorData.selectedWep = "";
            } else {
                if (!amount) return;
                this.creatorData.currentPrice -= this.creatorData.items.find(x => x.name === item).price * amount;
                this.creatorData.currentItems--;
                this.creatorData.selectedItems.splice(index, 1);
            }
        },
        changePage(page) {
            this.selectedPage = page;
            isDropdownOpen = false
        },
        handleKeyDown(event) {
            if (event.key === "Escape") {
                this.close();
            }
        },
        close() {
            fetch(`https://${GetParentResourceName()}/exit`);
            this.selectedPage = "mainmenu"
            isDropdownOpen = false

        },
        buyLoad(loadID) {
            console.log(loadID)
            fetch(`https://${GetParentResourceName()}/buyLoad`, {
                method: "POST",
                body: JSON.stringify({
                    loadID: loadID
                })
            });
        },

        createCustom() {
            if (!this.creatorData.selectedWep) return;
            if (this.creatorData.currentItems < 1) return;
            if (!this.creatorData.loadName) return;
            for (let word of this.blacklistedWords) {
                if (this.creatorData.loadName.includes(word)) {
                    fetch(`https://${GetParentResourceName()}/blackList`)
                    return;
                }
            }

            fetch(`https://${GetParentResourceName()}/createCustom`, {
                method: "POST",
                body: JSON.stringify({
                    weps: this.creatorData.selectedWep,
                    items: this.creatorData.selectedItems,
                    price: this.creatorData.currentPrice,
                })
            });
        }
    },


    mounted() {

        window.addEventListener('message', (event) => {
            if (event.data.type === "show") {
                this.showUI = event.data.enable
            } else if (event.data.type === "initThings") {
                this.premadeLoads = event.data.premadeLoads
                
            }
        });

        window.addEventListener('keydown', this.handleKeyDown);

    }
}).mount('#app');