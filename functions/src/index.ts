// import * as admin from "firebase-admin";
// import * as functions from "firebase-functions";

// const firestore = admin.firestore();


// const firebase_tools = require('firebase-tools');

// const firebaseConfig: string = process.env.FIREBASE_CONFIG ?? "";


// const adminConfig = JSON.parse(firebaseConfig);
// admin.initializeApp(adminConfig);

// // const db = admin.firestore();

// // exports.getMenu = functions.https.onCall((data, context) => {
// // 	const storeId = data.storeId;
// // 	const menuId = data.menuId;

// // });


// exports.getMenu = functions.https.onRequest((req, resp) => {
// 	const { storeId, menuId } = req.body;
// 	const ref = firestore.collection('stores').doc(storeId).collection('menus').doc(menuId);
// });
