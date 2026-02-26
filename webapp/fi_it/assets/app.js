/**
 * JS_LIB_
 * @author Antonio Polastri - ant.polastri@gmail.com - info@mpstyle.it
 */
// namespace
var JS_LIB_ = JS_LIB_ || {};
JS_LIB_.cons = {};
//constant data
const consologstyle = 'background: #222; color: #bada55;font-weight:800';
const consologstyleprimarymess = 'background: yellow; color: #000;font-weight:800;font-style: italic;';
JS_LIB_.cons = function() {

};


JS_LIB_.newCustomer = function() {

    let countrySelect;
    let stateSelect;
    let emailInput;
    let usernameInput;
    let unuseEmailCheckbox;
    let passwordInput;

    let lastFocusedName = null;

    const newCustomer_obj = this;

    let util;

    this.init = function() {

        util = new JS_LIB_.util();

        countrySelect = document.getElementById("newuserform_countryGeoId");
        stateSelect = document.getElementById("newuserform_stateProvinceGeoId");

        emailInput = document.getElementById("CUSTOMER_EMAIL");
        usernameInput = document.getElementById("USERNAME");
        unuseEmailCheckbox = document.getElementById("UNUSEEMAIL");
        passwordInput = document.getElementById("PASSWORD");

        bindEvents();

        if (countrySelect && countrySelect.value)
            loadStates(countrySelect.value);

        //hideShowUsaStates();

        syncUsernameWithEmail();
    };

    function bindEvents() {

        if (countrySelect)
            countrySelect.addEventListener("change", function() {

                loadStates(this.value);
                //hideShowUsaStates();

            });

        if (emailInput)
            emailInput.addEventListener("input", syncUsernameWithEmail);

        if (unuseEmailCheckbox)
            unuseEmailCheckbox.addEventListener("change", syncUsernameWithEmail);

        if (usernameInput)
            usernameInput.addEventListener("focus", clickUsername);

        if (passwordInput)
            passwordInput.addEventListener("focus", function() {

                lastFocusedName = "PASSWORD";

            });

        document
            .querySelectorAll("#newuserform input, #newuserform select")
            .forEach(function(el) {

                el.addEventListener("focus", function() {

                    lastFocusedName = this.name;

                });

            });
    }

    function syncUsernameWithEmail() {

        if (!usernameInput || !emailInput || !unuseEmailCheckbox)
            return;

        if (unuseEmailCheckbox.checked)
        {
            usernameInput.value = emailInput.value;

            usernameInput.readOnly = true;
        }
        else
        {
            usernameInput.readOnly = false;
        }
    }

    function clickUsername() {

        if (!unuseEmailCheckbox)
            return;

        if (unuseEmailCheckbox.checked)
        {
            if (lastFocusedName === "UNUSEEMAIL")
            {
                passwordInput.focus();
            }
            else
            {
                passwordInput.focus();
            }
        }
    }

    function hideShowUsaStates() {

        if (!countrySelect || !stateSelect)
            return;

        if (countrySelect.value === "USA" ||
            countrySelect.value === "UMI")
        {
            stateSelect.style.display = "block";
        }
        else
        {
            stateSelect.style.display = "none";
        }
    }

    async function loadStates(countryGeoId)
    {
        if (!stateSelect)
            return;

        stateSelect.innerHTML =
            '<option value="">Caricamento...</option>';

        try
        {
            const response =
                await fetch(
                    OFBIZ_URL_GET_STATES +
                    "?countryGeoId=" + countryGeoId
                );

            const text =
                await response.text();

            const data =
                util.parseOfbizJson(text);

            stateSelect.innerHTML =
                '<option value="">Seleziona uno stato</option>';

            if (data.stateList)
            {
                data.stateList.forEach(function(stateString) {

                    const parts =
                        stateString.split(": ");

                    if (parts.length !== 2)
                        return;

                    const geoName = parts[0];
                    const geoId = parts[1];

                    const option =
                        document.createElement("option");

                    option.value = geoId;
                    option.textContent = geoName;

                    stateSelect.appendChild(option);

                });
            }

        }
        catch(error)
        {
            console.error(error);

            stateSelect.innerHTML =
                '<option value="">Errore caricamento</option>';
        }
    }

};


JS_LIB_.categoryDetail = function() {

    var category_obj = this;

    this.init = function(){

        category_obj.addItemFromCategory();
        category_obj.initMiniCart();

    }

    this.addItemFromCategory = function(){

        $("a[id^='size-the']").on("click", function() {

            let fullId = $(this).attr("id");

            let formId = fullId.replace("size-", "");

            let actionUrl = $(this).data("action");

            var form = $(this).closest("form");

            var action = form.attr("action");

            var data = form.serialize();

            $.ajax({
                    url: action,
                    type: "POST",
                    data: data,

                    success: function(){
                        category_obj.refreshMiniCart();
                    },

                    error: function(data){
                        console.log(data);
                    }
                });
            });
    }

   this.refreshMiniCart = function(){

           $.ajax({

               url: "/fi_it/control/ajaxMiniCart",
               type: "GET",

               success: function(html){

                   $("#miniCartContainer").html(html);

                   $("#top-cart").addClass("top-cart-open");
               }
           });
   }

   this.initMiniCart = function(){

       $(document).off("click", "#top-cart-trigger").on("click", "#top-cart-trigger", function(e){

           e.preventDefault();

           $("#top-cart").toggleClass("open");

       });
   }
}


/*
*  faq page
*/
JS_LIB_.faq = function() {

	var faq_obj = this;

	let util;

	util = new JS_LIB_.util();

	this.init = function(){

	    faq_obj.activeVoices();

	}

	this.activeVoices = function () {

        var $faqItems = jQuery('#faqs .faq');

        if( window.location.hash != '' ) {
            var getFaqFilterHash = window.location.hash;
            var hashFaqFilter = getFaqFilterHash.split('#');
            if( $faqItems.hasClass( hashFaqFilter[1] ) ) {
                jQuery('.grid-filter li').removeClass('activeFilter');
                jQuery( '[data-filter=".'+ hashFaqFilter[1] +'"]' ).parent('li').addClass('activeFilter');
                var hashFaqSelector = '.' + hashFaqFilter[1];
                $faqItems.css('display', 'none');
                if( hashFaqSelector != 'all' ) {
                    jQuery( hashFaqSelector ).fadeIn(500);
                } else {
                    $faqItems.fadeIn(500);
                }
            }
        }

        jQuery('.grid-filter a').on( 'click', function(){
            jQuery('.grid-filter li').removeClass('activeFilter');
            jQuery(this).parent('li').addClass('activeFilter');
            var faqSelector = jQuery(this).attr('data-filter');
            $faqItems.css('display', 'none');
            if( faqSelector != 'all' ) {
                jQuery( faqSelector ).fadeIn(500);
            } else {
                $faqItems.fadeIn(500);
            }
            return false;
       });

	}

};


JS_LIB_.showCart = function() {

    var showCart_obj = this;

    this.init = function(){

        showCart_obj.removeItemSelected();

    }

    this.removeItemSelected = function(){

         $(".remove").on("click", function(e){

             e.preventDefault();

             let index = $(this).data("index");

             let form = document.forms["cartform"];

             form.selectedItem.value = index;
             form.removeSelected.value = "true";

             form.submit();

         });
    }
};


JS_LIB_.productDetail = function() {

	var product_obj = this;

	let util;

	this.init = function() {

		util = new JS_LIB_.util();

        util.hideProductDetailPageAlert();

		product_obj.addItem();

		product_obj.setupThumbs();

	};


    this.addItem = function() {

            /*
         $("#addToCart").click(function (e) {

                let checkRadio = document.querySelector('input[name="bag-size"]:checked');

                if (checkRadio === null) {
                    e.preventDefault();
                    util.showProductDetailPageAlert();
                    return;
                }

                const productVariant = checkRadio.dataset.productVariant;

                $('#add_product_id').val(productVariant);

                document.addform.submit();

         });
         */


         $("#addToCart").click(function (e) {

             let checkRadio = document.querySelector('input[name="bag-size"]:checked');

             if (checkRadio === null) {
                 e.preventDefault();
                 util.showProductDetailPageAlert();
                 return;
             }

             const productVariant = checkRadio.dataset.productVariant;

             $('#add_product_id').val(productVariant);

             var form = $(this).closest("form");

             var action = form.attr("action");

             var data = form.serialize();

             console.log("form: "+form);
             console.log("action: "+action);
             console.log("data: "+data);

            $.ajax({
                    url: action,
                    type: "POST",
                    data: data,

                    success: function(){
                        product_obj.refreshMiniCart();
                    },

                    error: function(data){
                        console.log(data);
                    }
            });

         });

        $('input[name="bag-size"]').on('change', function () {
            const selected = document.querySelector('input[name="bag-size"]:checked');
            if (selected) {
                util.hideProductDetailPageAlert();
            }
        });

    };

    this.setupThumbs = function(){

        var thumbs = document.querySelectorAll('.flex-control-nav.flex-control-thumbs img');
        var blankSkuUrl = '/fi_it/assets/images/blank_sku.jpg';

        thumbs.forEach(function(thumb) {
            thumb.addEventListener('error', function() {
                this.onerror = null; // Previeni loop infinito
                this.src = blankSkuUrl;
            });
        });

    }

    this.refreshMiniCart = function(){

           $.ajax({

               url: "/fi_it/control/ajaxMiniCart",
               type: "GET",

               success: function(html){

                   $("#miniCartContainer").html(html);

                   $("#top-cart").addClass("top-cart-open");
               }
           });
       }

}; //end product class



JS_LIB_.homepage = function() {

	var homepage_obj = this;

	let util;

	this.init = function() {

		util = new JS_LIB_.util();

		homepage_obj.chooseLanguage();

	};

	this.chooseLanguage = function(){

	    document.querySelectorAll('[data-locale]').forEach(function(el) {
            el.addEventListener('click', function(e) {
                e.preventDefault();
                document.getElementById('newLocaleInput').value = this.dataset.locale;
                document.getElementById('chooseLanguageForm').submit();
            });
        });

    }

}


/*
 * INIT GENERIC EVENT
 * */
JS_LIB_.event = function() {

	var event = this;

};


JS_LIB_.util = function() {

	let utilObj = this;

	this.getPage = function() {

    	var url = $('meta[name=pcn]').attr("content");

    	return url;
    };

    this.showProductDetailPageAlert = function() {

        $('.alert-warning').show();
    }

    this.hideProductDetailPageAlert = function() {

        $('.alert-warning').hide();
    }

    this.parseOfbizJson = function(text){

        return JSON.parse(
                text.startsWith("//")
                    ? text.substring(2)
                    : text
            );
    }

};



/*
 * generic loader for all the pages => page controller
 *
 */

JS_LIB_.pageController = function() {

	this.init = function() {

		let util = new JS_LIB_.util();
		//let events = new JS_LIB_.event();

		//events.init();
		console.log('%c -----<>------------------ IF YOU ARE HERE  :)------MPSTYLE-------------<>----', consologstyleprimarymess);
		//var scroll = new SmoothScroll('a[href*="#"]');
		//console.log('%c Click', consologstyle);
		//console.log('%c PAGE CONTROLLER INIT -----------------------', consologstyle);

		console.log('%c FRONT_CONTROLLER : ' + util.getPage(), consologstyle);


		/* page controller */

		switch (util.getPage()) {

            case 'homepage':

                var homepage = new JS_LIB_.homepage();
                homepage.init();

            	break;


			case 'faq':

                var faq = new JS_LIB_.faq();
                faq.init();

				break;/*product page*/


			case 'productdetail':

				var productDetail = new JS_LIB_.productDetail();
				productDetail.init();

				break;

            case 'categorydetail':

                var category = new JS_LIB_.categoryDetail();
                category.init();

                break;

            case 'showCart':

                var showCart = new JS_LIB_.showCart();
                showCart.init();

                break;

            case 'newCustomer':

                var newCustomer = new JS_LIB_.newCustomer();
                newCustomer.init();

                break;

		}

	};

};