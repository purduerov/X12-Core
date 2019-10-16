import React from 'react';
import './Gamepad.css';
import { Button, Row, Col } from 'react-bootstrap';
import {ipcRenderer} from 'electron';
import { CALIBRATE_CALL } from '../../constants';

class Gamepad extends React.Component {
	constructor(props) {
		super(props);
		this.calibrateClick = this.calibrateClick.bind(this);
		this.state.message = 'Hello';

		ipcRenderer.on(CALIBRATE_RECEIVE, (event, args) => {
			this.setState({message: args});
		});
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
				<Row style={{height: '90%', paddingTop: '1rem'}}>
					{this.state.message}
				</Row>
			</Col>
		);
	}
}

export default Gamepad;
