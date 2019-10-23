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
		}

		ipcRenderer.on(CALIBRATE_RECEIVE, (event, args) => {
			this.setState({status: args});
			if(args == 'Calibrating controller...') this.setState({calibrating: true});
		});

		ipcRenderer.on(STORE_UPDATED, (event, args) =>{
			let out = JSON.stringify(args.gamepad.state);
			this.setState({message: out});
		})
	}

	calibrateClick(){
		ipcRenderer.send(CALIBRATE_CALL);
	}

	

	render() {
		return (
			<Col>
				<Row style={{height: '10%'}}>
					<Button onClick={this.calibrateClick}>Calibrate</Button>
				</Row>
				<Row style={{height: '10%', paddingTop: '1rem'}}>
					Status: {this.state.status}
				</Row>
				<Row style={{height: '80%', paddingTop: '1rem', overflowWrap: 'break-word'}}>
					{this.state.message}
				</Row>
			</Col>
		);
	}
}

export default Gamepad;
