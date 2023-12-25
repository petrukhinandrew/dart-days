(window.cbJsonP=window.cbJsonP||[]).push([[157],{185:function(e,t,n){"use strict";var i=n(21),a=n.n(i),r=n(24),o=n.n(r),s=n(8),d=n.n(s),c=n(2),u=n.n(c),l=n(5),m=n.n(l),f=n(4),h=n(30),A=n(1),w=n(6),g=n(19),p=n(26),y=n(14),v=n(7),S=n(46),E=n(17),R=window.addEventListener?"addEventListener":"attachEvent",M=window[R],F="attachEvent"==R?"onmessage":"message",T=(m()(_,[{key:"listen",value:function(){var c=this;M(F,function(i){if(Object(E.a)()&&console.log("message received",i.data),"object"==d()(i.data)&&null!=i.data&&i.data.cbEvent){var a=i.data;if((a.targetWindowName==window.name||c.windowType==A.o.Host&&a.targetWindowName==v.a.HOST_NAME)&&!(c.windowType==A.o.Component&&i.origin!=f.a.getJSDomainIframeCommunication()||c.windowType==A.o.Master&&i.origin!=f.a.getJSDomainIframeCommunication()&&i.source!==window.parent)){var r=a.replyId,o=a.srcWindowName,s=a.message;s&&s.action&&(h.a.notTrue(function(){return c.windowType!=A.o.Component||a.srcWindowName==v.a.MASTER_FRAME},Object(p.d)(g.e.receiveMessageError)),w.a.resolve(s).then(function(e){if(!(s.options&&s.options.noReply||a.srcWindowName===a.targetWindowName)){var t={replyId:r,message:e,cbEvent:!0,targetWindowName:a.srcWindowName};c.postMessage(o,t,i.origin)}}).catch(function(e){if(!(s.options&&s.options.noReply||a.srcWindowName===a.targetWindowName)){var t=new g.a(e),n={replyId:r,error:Object(y.l)(t),message:e.message,cbEvent:!0,targetWindowName:a.srcWindowName};c.postMessage(o,n,i.origin)}}))}}})}},{key:"postMessage",value:function(e,t,n){var i=this;h.a.notTrue(function(){return i.windowType!=A.o.Component||e==v.a.MASTER_FRAME},Object(p.d)(g.e.responseError)),h.a.notTrue(function(){return i.windowType!=A.o.Component||n==f.a.getJSDomainIframeCommunication()},Object(p.d)(g.e.responseMismatchError)),Object(E.a)()&&console.log("response to --\x3e "+e+" "+o()(t));var a=this.getTargetWindow(e,{target_iframe_name:e,message_action:t.targetWindowName});try{Object(y.m)({targetWindow:a,message:t,targetIframeName:e,windowType:this.windowType,handlerType:A.n.Receiver})}catch(e){console.error(e)}Object(y.e)(a,t,n,A.n.Receiver)}},{key:"getTargetWindow",value:function(e,t){try{return this.windowType==A.o.Host?window.frames[e]:e&&e!=v.a.HOST_NAME?window.parent.frames[e]:window.parent}catch(e){if(this.windowType===A.o.Component||this.windowType===A.o.Master){var n=a()({},t,window.cb_site_info);S.a.error(e,n)}}}}]),_);function _(e){u()(this,_),this.windowType=e,this.listen()}t.a=T},231:function(e,t,n){"use strict";n.r(t);var i=n(2),a=n.n(i),r=n(5),o=n.n(r),s=n(3),l=n.n(s),c=n(21),m=n.n(c),d=n(15),f=n.n(d),u=n(7),h=n(1),A=n(4);function w(){var n=this;a()(this,w),this.iframeLoad=new f.a(function(e,t){n.iframeLoadSuccess=e,n.iframeLoadFailed=t}),this.initialize=new f.a(function(e,t){n.initializeSuccess=e,n.initializeFailed=t})}var g=(o()(w,[{key:"insertInside",value:function(e,t,n,i){var o=this,s=window.document.createElement("iframe");s.id=e,s.name=this.name,s.src=this.srcUrl,s.instance=this;var a="1.2em",r=m()({margin:"0",padding:"0",border:"none",overflow:"hidden",display:"block",minWidth:"100%",width:"1px",height:a},i);l()(r).forEach(function(e){s.style[e]=r[e]});var c=document.getElementById(e);if(c){if(s.id=s.id+"_frame",c.classList.add("CbHosted"),n&&r.height===a){n.container=c,this.componentField=n;var d=a;try{var u=n.parent.options.style.base.fontSize;~u.indexOf("px")&&(d=1.2*parseInt(u.replace("px",""))+"px"||a)}catch(e){}s.style.height=d}c.appendChild(s)}else t.insertBefore(s,null);return this.ref=s,new f.a(function(e,t){function n(){o.iframeLoadSuccess(),clearInterval(a),e(!0)}function i(){if(clearInterval(a),!A.a.isSPA()){var e=s.name+" iframe load failed";o.iframeLoadFailed(e),t(e)}}var a;s.onload=n;var r=0;a=setInterval(function(){window["cb-"+o.name+"-loaded"]?n():100<=++r&&i()},100),setTimeout(i,1e4)})}},{key:"insert",value:function(){var e=window.document.getElementById(u.a.CONTAINER);return this.insertInside(this.name,e)}},{key:"destroy",value:function(){this.ref.innerHTML="",this.componentField.container.removeChild(this.ref),delete this.ref,delete this.componentField}}],[{key:"masterFrame",value:function(e,t){var n=new w;return n.name=e,n.type=h.o.Master,n.srcUrl=t,n}},{key:"componentFrame",value:function(e,t){var n=new w;return n.name=e,n.type=h.o.Component,n.srcUrl=t,n}}]),w),p=n(64),y=n(185),v=n(30),S=n(302),E=n(6),R=n(19),M=n(26),F=n(14),T=n(17);n.d(t,"CHILD_IFRAME_NAME",function(){return _});var _=function(e,t){return"cb-component-"+e+"-"+t},b=function(){return"#"+encodeURIComponent(window.location.host)};function C(){a()(this,C),this.childFrames=[],this.connectionClient=new p.c(h.o.Host,!0),new y.a(h.o.Host),function(n){E.a.registerAction(h.i.Actions.TriggerEvent,{handle:function(e){var t=S.a.registry[e.data.frame];return v.a.notTrue(function(){return!!t},Object(M.d)(R.e.componentNotFound)),t.delegateEvent(e.data),new f.a(function(e,t){return e({acknowledged:!0})})}}),E.a.registerAction(h.i.Actions.ReceiveStatusBroadcast,{handle:function(e){var t=S.a.registry[e.data.frame];return v.a.notTrue(function(){return!!t},Object(M.d)(R.e.componentNotFound)),t.delegateEvent(e.data),new f.a(function(e,t){return e({acknowledged:!0})})}}),E.a.registerAction(h.i.Actions.setTestCards,{handle:function(e){var t=S.a.registry[e.data.frame];return t&&t.delegateEvent(e.data),f.a.resolve({acknowledged:!0})}}),E.a.registerAction(h.i.Actions.SetPaymentIntent3DSResult,{handle:function(e){return n.send({action:h.m.Actions.SetPaymentIntent3DSResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetAdyen3DS1VerificationResult,{handle:function(e){return n.send({action:h.m.Actions.SetAdyen3DS1VerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.m.Actions.SetCheckoutCom3DSVerificationResult,{handle:function(e){return n.send({action:h.m.Actions.SetCheckoutCom3DSVerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.m.Actions.SetCybersource3DSVerificationResult,{handle:function(e){return n.send({action:h.m.Actions.SetCybersource3DSVerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetAdyenIDealVerificationResult,{handle:function(e){try{n.send({action:h.m.Actions.CaptureKVL,data:m()({action:"iDeal_set_verification_result"},Object(F.l)(e.data))},u.a.MASTER_FRAME)}catch(e){}return n.send({action:h.m.Actions.SetAdyenIDealVerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetStripeIDealVerificationResult,{handle:function(e){try{n.send({action:h.m.Actions.CaptureKVL,data:m()({action:"iDeal_set_verification_result"},Object(F.l)(e.data))},u.a.MASTER_FRAME)}catch(e){}return n.send({action:h.m.Actions.SetStripeIDealVerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetAdyenSofortVerificationResult,{handle:function(e){return n.send({action:h.m.Actions.SetAdyenSofortVerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetAdyenBancontactVerificationResult,{handle:function(e){return n.send({action:h.m.Actions.SetAdyenBancontactVerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetAdyenGiropayVerificationResult,{handle:function(e){return n.send({action:h.m.Actions.SetAdyenGiropayVerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetAdyenDotpayVerificationResult,{handle:function(e){return n.send({action:h.m.Actions.SetAdyenDotpayVerificationResult,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetFrameLoaded,{handle:function(e){return window["cb-"+e.data.frame+"-loaded"]=!0,f.a.resolve({acknowledged:!0})}}),E.a.registerAction(h.i.Actions.CaptureKVL,{handle:function(e){return n.send({action:h.m.Actions.CaptureKVL,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.CaptureException,{handle:function(e){return n.send({action:h.m.Actions.CaptureException,data:e.data},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetAuthToken,{handle:function(e){return n.send({action:h.m.Actions.SetHpData,data:{jwt:Object(F.q)(e,"data.jwt")||""}},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetCustomerHandle,{handle:function(e){return n.send({action:h.m.Actions.SetHpData,data:{customer_handle:Object(F.q)(e,"data.customer_handle")||""}},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.SetPreviewPortalEmail,{handle:function(e){var t=Object(F.q)(e,"data.email")||"";return n.send({action:h.m.Actions.SetHpData,data:{preview_portal_email:t}},u.a.MASTER_FRAME)}}),E.a.registerAction(h.i.Actions.GetPreviewPortalEmail,{handle:function(){return n.send({action:h.m.Actions.GetHpData,data:{param:"preview_portal_email"}},u.a.MASTER_FRAME).then(function(e){var t=e.preview_portal_email,n=document.getElementById("cb-frame");return n&&t&&n.contentWindow.postMessage({action:"setPreviewPortalEmail",referrer:"chargebeejs",data:{preview_portal_email:t}},"*"),e})}}),E.a.registerAction(h.i.Actions.ShowFrame,{handle:function(e){return document.querySelector("iframe[name="+e.data+"]").style.display="block",new f.a(function(e,t){return e({acknowledged:!0})})}}),E.a.registerAction(h.i.Actions.HideFrame,{handle:function(e){return document.querySelector("iframe[name="+e.data+"]").style.display="none",new f.a(function(e,t){return e({acknowledged:!0})})}})}(this)}var I=new(o()(C,[{key:"createMasterFrame",value:function(){var i=this;return this.checkMasterInitialized()||(this.masterFrame=g.masterFrame(p.b,T.b.ASSET_PATH+"/master.html"+b()),this.commMgrReady=this.masterFrame.insert().then(function(){var e=A.a.getCbInstance(),t={host:window.location.origin,site:e.site,publishableKey:e.publishableKey,businessEntityId:A.a.getBusinessEntityId(),options:e.options,window_url:window.location.href},n={action:h.m.Actions.RegisterMaster,data:t};return i.register(n,i.masterFrame)}).catch(function(e){i.masterFrame.initializeFailed(new Error(Object(M.d)(R.e.errorMountingMaster))),console.error(Object(M.d)(R.e.errorMountingMaster)),e&&console.error(e)})),this.commMgrReady}},{key:"createCbFrame",value:function(e,t){var n=this,i=e.id,a=e.fieldType,r=(e.options,g.componentFrame(_.apply(null,[a,this.childFrames.length]),T.b.ASSET_PATH+"/component.html"+b()));return this.childFrames.push(r),r.insertInside(i,t,e).then(function(){return n.masterFrame.initialize}).then(function(){return r})}},{key:"createIDealFrame",value:function(e,t,n){var i=this,a=e.id,r=e.fieldType,o=g.componentFrame(_.apply(null,[r,this.childFrames.length]),T.b.ASSET_PATH+"/component.html"+b());return this.childFrames.push(o),o.insertInside(a,t,e,n).then(function(){return i.masterFrame.initialize}).then(function(){return o})}},{key:"register",value:function(e,t){var n=this;return this.masterFrame.iframeLoad.then(function(){return n.connectionClient.sendMessage(e,p.b,{timeout:1e4})}).then(function(){return t.initializeSuccess(),{registered:!0}}).catch(function(e){return t.initializeFailed(e),{registered:!1}})}},{key:"checkMasterInitialized",value:function(){var e=document.getElementById(p.b);return!this.masterFrame&&e&&(this.masterFrame=e.instance),!!this.masterFrame&&!!e}},{key:"send",value:function(e,t,n){var i=this;return this.createMasterFrame().then(function(){return i.masterFrame.initialize}).then(function(){return i.connectionClient.sendMessage(e,t,n)})}},{key:"listen",value:function(e){this.connectionClient.receiver.listen(e)}},{key:"deregister",value:function(t){this.childFrames=this.childFrames.filter(function(e){return e.name!==t})}}]),C);t.default=I},302:function(e,t,n){"use strict";var i=n(2),a=n.n(i),r=n(5),o=(n.n(r)()(s,null,[{key:"register",value:function(e,t){this.registry[t]=e}}]),s);function s(){a()(this,s)}o.registry={},t.a=o},6:function(e,t,n){"use strict";var i=n(2),a=n.n(i),r=n(5);function o(){a()(this,o),this.actionRegistry={}}var s=new(n.n(r)()(o,[{key:"registerAction",value:function(e,t){this.actionRegistry[e]=t}},{key:"resolve",value:function(e){var t=this.actionRegistry[e.action];if(t&&t.handle)return t.handle(e);console.log("Unknown action: "+t)}}]),o);t.a=s}}]);
//# sourceMappingURL=157-a769c2816568782be4f2.js.map