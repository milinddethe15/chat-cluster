import mongoose from "mongoose";

const clientOptions = { serverApi: { version: '1', strict: true, deprecationErrors: true } };
const connectToMongoDB = async () => {
	try {
		await mongoose.connect(process.env.MONGO_DB_URI, clientOptions);
		await mongoose.connection.db.admin().command({ ping: 1 });
		console.log("Connected to MongoDB");
	} catch (error) {
		console.log("Error connecting to MongoDB", error.message);
	}
};

export default connectToMongoDB;
