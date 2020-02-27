import React from 'react';
import './Gamepad.css';
import { Button, Row, Col } from 'react-bootstrap';
import {ipcRenderer} from 'electron';
import { CALIBRATE_CALL, CALIBRATE_RECEIVE , STORE_UPDATED} from '../../constants';

class Gamepad extends React.Component {
	constructor(props) {
		super(props);
		this.calibrateClick = this.calibrateClick.bind(this);
		this.state = {
			message: 'something',
			status: 'Booting...',
			calibrating: false
		};

		ipcRenderer.on(CALIBRATE_RECEIVE, (event, args) => {
			this.setState({status: args});
			if(args == 'Calibrating controller...') this.setState({calibrating: true});
		});

		ipcRenderer.on(STORE_UPDATED, (event, args) => {
			console.log(args);
			let out = JSON.stringify(args.gamepad.state);
			this.setState({message: out});
		});
	}

	calibrateClick(){
		ipcRenderer.send(CALIBRATE_CALL);
	}

	

	render() {
		return (
			<Col>
				<Row style={{height: '20%'}}>
					<Button onClick={this.calibrateClick}>Calibrate</Button>
				</Row>
				<Row style={{height: '20%'}}>
					Status: {this.state.status}
				</Row>
				<div className='text-area' style={{height: '60%', overflowWrap: 'break-word'}}>
					{this.state.message}
				</div>
			</Col>
		);
	}
}

export default Gamepad;
