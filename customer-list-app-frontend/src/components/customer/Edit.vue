<template>
   <div>
        <h4 class="text-center mt-20">
         <small>
         <button class="btn btn-success" v-on:click="navigate()"> View All Customers </button>
         </small>
        </h4>

        <div class="col-md-12 form-wrapper">
          <h2> Edit company </h2>
          <form id="create-post-form" @submit.prevent="editCustomer">
               <div class="form-group col-md-12">
                <label for="title"> Name </label>
                <input type="text" id="first_name" v-model="customer.first_name" name="title" class="form-control" placeholder="company name">
               </div>

               

             <div class="form-group col-md-12">
                <label for="title"> Email </label>
                <input type="text" id="email" v-model="customer.email" name="title" class="form-control" placeholder="Enter email">
            </div>

            <div class="form-group col-md-12">
                <label for="title"> Phone </label>
                <input type="text" id="phone_number" v-model="customer.phone" name="title" class="form-control" placeholder="Enter Phone number">
            </div>

            <div class="form-group col-md-12">
                <label for="title"> Address </label>
                <input type="text" id="address" v-model="customer.address" name="title" class="form-control" placeholder="Enter Address">
            </div>

              <div class="form-group col-md-12">
                  <label for="description"> status </label>
                  <input type="text" id="description" v-model="customer.description" name="description" class="form-control" placeholder="status">
              </div>

              <div class="form-group col-md-4 pull-right">
                  <button class="btn btn-success" type="submit"> Edit company </button>
              </div>          
          </form>
        </div>
    </div>
</template>

<script>
import { server } from "../../helper";
import axios from "axios";
import router from "../../router";
export default {
  data() {
    return {
      id: 0,
      customer: {}
    };
  },
  created() {
    this.id = this.$route.params.id;
    this.getCustomer();
  },
  methods: {
    editCustomer() {
      let customerData = {
        first_name: this.customer.first_name,
        last_name: this.customer.last_name,
        email: this.customer.email,
        phone: this.customer.phone,
        address: this.customer.address,
        description: this.customer.description
      };

      axios
        .put(
          `${server.baseURL}/customer/update?customerID=${this.id}`,
          customerData
        )
        .then(data => {
          router.push({ name: "home" });
        });
    },
    getCustomer() {
      axios
        .get(`${server.baseURL}/customer/customer/${this.id}`)
        .then(data => (this.customer = data.data));
    },
    navigate() {
      router.go(-1);
    }
  }
};
</script>

