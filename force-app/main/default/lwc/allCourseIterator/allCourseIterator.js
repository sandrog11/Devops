import { LightningElement } from 'lwc';

export default class AllCourseIterator extends LightningElement {
    allCourseDetails = [
        {courseName: 'LWC', courseDuration :'20 days'},
        {courseName: 'Aura Component', courseDuration :'20 days'},
        {courseName: 'Design Pattern', courseDuration :'30 days'},
        {courseName: 'JavaScript', courseDuration :'30 days'}
    ];
}