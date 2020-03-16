<template>
    <div class="container">
        <div class="columns">
            <div class="column is-one-fifth">
                <aside class="menu">
                    <p class="menu-label is-size-6">
                        <strong>Student</strong>
                    </p>
                    <ul class="menu-list">
                        <li @click="sAttendanceX"><a>Attendance</a></li>
                        <li @click="reportsX"><a>Reports</a></li>
                    </ul>
                    <p class="menu-label is-size-6">
                        <strong>Faculty</strong>
                    </p>
                    <ul class="menu-list">
                        <li @click="fAttendanceX"><a>Attendance</a></li>
                        <li @click="marksX"><a>Marks</a></li>
                        <li @click="faX"><a>FA Warning</a></li>
                    </ul>
                    <p class="menu-label is-size-6">
                        <strong>Time Table</strong>
                    </p>
                    <ul class="menu-list">
                        <!-- <li @click="tsX"><a>View Today's Schedule</a></li> -->
                        <li @click="ttX"><a>My Timetable</a></li>
                        <li @click="cttX"><a>My Class Timetable</a></li>
                    </ul>
                </aside>
            </div>
            
            <div class="column" id="dash">

                <template v-if="sAttendance">
                    Student Attendance
                </template>

                <template v-else-if="reports">
                    Reports
                </template>

                <template v-else-if="fAttendance">
                    Faculty Attendance
                </template>

                <template v-else-if="marks">
                    Marks
                </template>

                <template v-else-if="fa">
                    FA List
                </template>

                <!-- <template v-else-if="ts">
                    Today's Schedule
                </template> -->

                <template v-else-if="tt">
                    <h1 class="title has-text-centered">My Timetable</h1>
                    <form class="columns" @submit.prevent="displayTT">
                        <div class="column is-one-fourth">

                        </div>
                        <div class="control column is-one-fourth">
                            <div class="select is-fullwidth is-info is-rounded">
                                <select name="year" v-model="year">
                                    <option selected>Select the year 😄</option>
                                    <option>2016</option>
                                    <option>2017</option>
                                    <option>2018</option>
                                    <option>2019</option>                              
                                </select>
                            </div>
                        </div>
                        <div class="column is-one-fourth">
                            <button type="submit" class="button is-fullwidth is-rounded is-success is-light is-outlined">View Timetable! 👀</button>
                        </div>
                        
                        <div class="column is-one-fourth">

                        </div>
                    </form>
                    
                    <template v-if="tyear==='2016'">
                        <object data="https://iris-faculty-timetable.s3.amazonaws.com/2018_19_E_30122635.pdf" type="application/pdf" width="100%" height="100%">
                        </object>
                    </template>

                    <template v-else-if="tyear==='2017'">
                        <object data="https://iris-faculty-timetable.s3.amazonaws.com/2018_19_O_30122635.pdf" type="application/pdf" width="100%" height="100%">
                        </object>
                    </template>

                    <template v-else-if="tyear==='2018'">
                        <object data="https://iris-faculty-timetable.s3.amazonaws.com/2019_20_E_30122635.pdf" type="application/pdf" width="100%" height="100%">
                        </object>
                    </template>

                    <template v-else-if="tyear==='2019'">
                        <object data="https://iris-faculty-timetable.s3.amazonaws.com/2019_20_O_30122635.pdf" type="application/pdf" width="100%" height="100%">
                        </object>
                    </template>

                </template>

                <template v-else-if="ctt">
                    <h1 class="title has-text-centered">My Class Timetable</h1>

                    <form @submit.prevent="displayCTT" class="columns">
                        <div class="column is-one-fourth">

                        </div>
                        <div class="control column is-one-fourth">
                            <div class="select is-fullwidth is-info is-rounded">
                                <select class="is-medium" name="classr" v-model="classr">
                                    <option>Select the class 😄</option>
                                    <option>19-CSE-F</option>
                                    <option>18-CSE-E</option>
                                    <option>17-CSE-A</option>
                                    <option>18-CSE-B</option>                              
                                </select>
                            </div>
                        </div>
                        <div class="column is-one-fourth">
                            <button type="submit" class="button is-fullwidth is-rounded is-success">View Timetable! 👀</button>
                        </div>
                        <div class="column is-one-fourth">

                        </div>
                    </form>
                    
                    <template v-if="tclassr==='19-CSE-F'">
                        <object data="https://iris-faculty-timetable.s3.amazonaws.com/2018_19_E_30122635.pdf" type="application/pdf" width="100%" height="100%">
                        </object>
                    </template>

                    <template v-else-if="tclassr==='18-CSE-E'">
                        <object data="https://iris-faculty-timetable.s3.amazonaws.com/2018_19_O_30122635.pdf" type="application/pdf" width="100%" height="100%">
                        </object>
                    </template>

                    <template v-else-if="tclassr==='17-CSE-A'">
                        <object data="https://iris-faculty-timetable.s3.amazonaws.com/2019_20_E_30122635.pdf" type="application/pdf" width="100%" height="100%">
                        </object>
                    </template>

                    <template v-else-if="tclassr==='18-CSE-B'">
                        <object data="https://iris-faculty-timetable.s3.amazonaws.com/2019_20_O_30122635.pdf" type="application/pdf" width="100%" height="100%">
                        </object>
                    </template>
                </template>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
//   * {
//     transition: all 0.3s ease-in-out;
//     background: var(--primary);
//     color: var(--light);
//   }

//   .is-fullwidth {
//     width: 100%;
//   }

//   #profile,
//   .is-center {
//     min-height: 100vh;
//     align-items: center;
//     justify-content: center;
//   }

//   .media-content {
//     max-width: 90vw;

//     h1 {
//       text-overflow: clip;
//       color: var(--font2);
//     }
//   }

//   .content {
//     padding-top: 2.5rem;
//   }

//   .pad {
//     padding: 1rem;
//   }

//   .box {
//     background: var(--tertiary);

//   }

//   .is-underlined {
//     text-decoration: underline;
//   }

</style>

<script>
    import firebase from '~/plugins/firebase'
    import db from '~/plugins/firebase'

    export default {
        data() {
            return {
                email: '',
                userData: {
                    name: '',
                    gender: '',
                    email: '',
                    phone_number: '',
                    display: '',
                },
                sAttendance: true,
                reports: '',
                fAttendance: '',
                marks: '',
                fa: '',
                ts: '',
                tt: '',
                ctt: '',
                year: '',
                tyear: '',
                classr: '',
                tclassr: ''
            }
        },
        

        layout: 'nav',

        methods: {
            displayTT() {
                this.tyear = this.year
            },

            displayCTT() {
                this.tclassr = this.classr
            },

            sAttendanceX() {
                this.sAttendance = true
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            reportsX() {
                this.sAttendance = false
                this.reports = true
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            fAttendanceX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = true
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            marksX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = true
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            faX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = true
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            tsX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = true
                this.tt = false
                this.ctt = false
            },
            ttX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = true
                this.ctt = false
            },
            cttX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = true
            }
        },

        created() {
            let user = firebase.auth().currentUser
            // db.collection('profile').doc(user.uid)
        }
    }
</script>