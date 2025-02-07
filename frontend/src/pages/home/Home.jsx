import MessageContainer from "../../components/messages/MessageContainer";
import Sidebar from "../../components/sidebar/Sidebar";

const Home = () => {
	return (
		<div className='flex sm:h-[700px] md:h-[700px] rounded-lg overflow-hidden bg-gray-700 bg-clip-padding backdrop-filter backdrop-blur-lg bg-opacity-90'>
			<Sidebar />
			<MessageContainer />
		</div>
	);
};
export default Home;
