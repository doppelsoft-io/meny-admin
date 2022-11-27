import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import * as cors from "cors";
const corsHandler = cors({ origin: true });

const firebaseConfig: string = process.env.FIREBASE_CONFIG ?? "";
const adminConfig = JSON.parse(firebaseConfig);
admin.initializeApp(adminConfig);

const firestore = admin.firestore();

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
export const getMenu = functions.https.onRequest(async (request, response) => {
	corsHandler(request, response, async () => {

		const { storeId, menuId } = request.body;

		if (!storeId) {
			response.status(404).send({
				"message": "Could not load menu",
				"reason": "Store ID does not exist",
				"details": {
					"storeId": storeId,
					"menuId": menuId,
				},
			});
		}
		if (!menuId) {
			response.status(404).send({
				"message": "Could not load menu",
				"reason": "Menu ID does not exist",
				"details": {
					"storeId": storeId,
					"menuId": menuId,
				},
			});
		}

		const storeRef = firestore.collection('stores').doc(storeId);
		const compiledMenuRef = firestore.collection('stores').doc(storeId).collection('compiled_menus').doc(menuId);
		const storeDoc = await storeRef.get();
		const menuDoc = await compiledMenuRef.get();

		if (storeDoc.exists && menuDoc.exists) {
			const storeJson = storeDoc.data() || {};
			// response.json(menuDoc.data());
			response.json({
				'store': {
					'name': storeJson['name'],
				},
				'menu': menuDoc.data(),
			})
		} else {
			response.status(404).send({
				"message": "Something went wrong fetching this menu",
				"details": {
					"storeId": storeId,
					"menuId": menuId,
				},
			});
		}
	});

});
