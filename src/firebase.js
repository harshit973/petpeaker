import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";
import {getAuth} from 'firebase/auth'
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDn61iKentZZHtjuFSh-j0BZNi8jgz7KpM",
  authDomain: "petpeaker-f12f2.firebaseapp.com",
  projectId: "petpeaker-f12f2",
  storageBucket: "petpeaker-f12f2.appspot.com",
  messagingSenderId: "706723310349",
  appId: "1:706723310349:web:120ecc0401e4b33bec9e44",
  measurementId: "G-61QP0PBWQC"
};
const app = initializeApp(firebaseConfig);
export const db=getFirestore(app)
export const auth=getAuth(app)