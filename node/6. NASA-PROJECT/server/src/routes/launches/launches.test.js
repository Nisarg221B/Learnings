const request = require('supertest');
const app = require('../../app');

describe('Test GET /launches', () => {
    test('It should respond with 200 sucess', async () => {
        const response = await request(app)
            .get('/launches')
            .expect('Content-Type', /json/)
            .expect(200);
        //expect(response.statusCode).toBe(200);

    });
});

describe('Test POST /launches', () => {
    const completeLaunchData = {
        mission: 'USS Enterprise',
        rocket: 'NCC 1701-D',
        target: 'Kepler-186 f',
        launchDate: 'January 4, 2028',
    };

    const launchDataWithoutDate = {
        mission: 'USS Enterprise',
        rocket: 'NCC 1701-D',
        target: 'Kepler-186 f',
    };

    const launchDataWithInvalidDate = {
        mission: 'USS Enterprise',
        rocket: 'NCC 1701-D',
        target: 'Kepler-186 f',
        launchDate: 'Not a Date la la la la',
    };


    test('It should respond with 201 created', async () => {
        const response = await request(app)
            .post('/launches')
            .send(completeLaunchData)
            .expect('Content-Type', /json/)
            .expect(201);

        const requestDate = new Date(completeLaunchData.launchDate).valueOf();
        const responseDate = new Date(response.body.launchDate).valueOf();

        expect(responseDate).toBe(requestDate);
        expect(response.body).toMatchObject(launchDataWithoutDate); // Matches the object partially 
    });

    test('It should catch missing required properties', async () => {
        const response = await request(app)
            .post('/launches')
            .send(launchDataWithoutDate) // date not provided thus missing property and should return 400 status code
            .expect('Content-Type', /json/)
            .expect(400);
        expect(response.body).toStrictEqual({
            error: "missing required launch property",
        });
    });
    test('It should catch invalid dates', async() => {
        const response = await request(app)
            .post('/launches')
            .send(launchDataWithInvalidDate) // date not provided thus missing property and should return 400 status code
            .expect('Content-Type', /json/)
            .expect(400);
        expect(response.body).toStrictEqual({
            error: "Invalid launch date",
        });
    });
})