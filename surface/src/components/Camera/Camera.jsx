import React from 'react';
import { Col, Row, Container } from 'react-bootstrap';

class Camera extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			cameras: [
				{
					url: 'url1'
				},
				{
					url: 'url2'
				},
				{
					url: 'url3'
				},
				{
					url: 'url4'
				},
				{
					url: 'url5'
				}
			]
		};
	}

	render() {
		return (
			<Container>
				<Row style={{height: '80%'}}>
					<Col>
						<img src="http://192.168.1.2:8090/test.mjpg" width="100%"/>
					</Col>
				</Row>
				<Row style={{height: '20%'}}>
					<Col>
						<img src="http://127.0.0.1:8080/cam.mjpg" width="100%"/>
					</Col>
					<Col>
						<img src="http://127.0.0.1:8080/cam.mjpg" width="100%"/>
					</Col>
					
					<Col>
						<img src="http://127.0.0.1:8080/cam.mjpg" width="100%"/>
					</Col>
					<Col>
						<img src="http://127.0.0.1:8080/cam.mjpg" width="100%"/>
					</Col>
				</Row>
			</Container>
		);
	}
}

//ffserver

export default Camera;
