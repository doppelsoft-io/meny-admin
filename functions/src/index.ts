import * as functions from "firebase-functions";

import * as admin from "firebase-admin";

const firebase_tools = require('firebase-tools');

const firebaseConfig: string = process.env.FIREBASE_CONFIG ?? "";


const adminConfig = JSON.parse(firebaseConfig);
admin.initializeApp(adminConfig);

// const db = admin.firestore();

exports.recursiveDelete = functions
	.runWith({
		timeoutSeconds: 540,
		memory: '2GB'
	})
	.https.onCall(async (data, context) => {
		// Only allow admin users to execute this function.
		// console.log('context.auth', context.auth);

		// if (!(context.auth && context.auth.token && context.auth.token.admin)) {
		//   throw new functions.https.HttpsError(
		//     'permission-denied',
		//     'Must be an administrative user to initiate delete.'
		//   );
		// }

		try {
			const path = data.path;

			// Run a recursive delete on the given document or collection path.
			// The 'token' must be set in the functions config, and can be generated
			// at the command line by running 'firebase login:ci'.
			await firebase_tools.firestore
				.delete(path, {
					project: process.env.GCLOUD_PROJECT,
					recursive: true,
					yes: true,
					token: functions.config()?.fb?.token
				});

			return {
				path: path
			};

		} catch (err) {
			console.log('err', err);
			return null;
		}
	});
