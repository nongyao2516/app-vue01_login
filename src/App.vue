<template>
<div>

  <nav class="navbar navbar-expand-lg navbar-light bg-info-subtle shadow-sm">
    <div class="container">

      <router-link class="navbar-brand fw-bold" to="/">
        Navbar
      </router-link>

      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav me-auto mb-2 mb-lg-0">

          <li class="nav-item">
            <router-link class="nav-link" to="/">Home</router-link>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/customer">Customer</router-link>
          </li>

          <li class="nav-item" v-if="isLoggedIn">
            <router-link class="nav-link" to="/customer_crud">
              Customer Crud
            </router-link>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/contact">Contact</router-link>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/type">Type</router-link>
          </li>

          <!-- Employee -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
              Employee
            </a>
            <ul class="dropdown-menu">
              <li><router-link class="dropdown-item" to="/employee">Employee</router-link></li>
              <li v-if="isLoggedIn">
                <router-link class="dropdown-item" to="/employee_crud">
                  Employee Crud
                </router-link>
              </li>
            </ul>
          </li>

          <!-- Product -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
              Product
            </a>
            <ul class="dropdown-menu">
              <li><router-link class="dropdown-item" to="/product">Product</router-link></li>
              <li v-if="isLoggedIn">
                <router-link class="dropdown-item" to="/product_crud">
                  Product Crud
                </router-link>
              </li>
            </ul>
          </li>
        </ul>

        <!-- ✅ Login Info -->
        <div class="d-flex align-items-center">

          <!-- แสดงชื่อ -->
          <span v-if="isLoggedIn" class="me-3">
            👤 <span class="badge bg-success">{{ userName }}</span>
          </span>

          <router-link
            v-if="!isLoggedIn"
            to="/login"
            class="btn btn-primary"
          >
            Login
          </router-link>

          <button
            v-if="isLoggedIn"
            @click="logout"
            class="btn btn-danger"
          >
            Logout
          </button>

        </div>

      </div>
    </div>
  </nav>

  <div class="container mt-3">
    <router-view/>
  </div>

</div>
</template>

<script>
export default {
  data() {
    return {
      isLoggedIn: false,
      userName: ""
    }
  },

  mounted() {
    this.checkLogin()
  },

  methods: {
    checkLogin() {
      this.isLoggedIn = !!localStorage.getItem("adminLogin")

      if (this.isLoggedIn) {
        const user = JSON.parse(localStorage.getItem("user"))
        this.userName = user?.name || "Admin"
      }
    },

    logout() {
      localStorage.removeItem("adminLogin")
      localStorage.removeItem("user")

      this.isLoggedIn = false
      this.userName = ""

      this.$router.push("/login")
    }
  },

  watch: {
    '$route'() {
      this.checkLogin()
    }
  }
}
</script>