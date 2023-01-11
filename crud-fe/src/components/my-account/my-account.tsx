import { useState, useEffect } from "react";
import { useMutation, gql } from "@apollo/client";

import { TextInputField } from "./text-input-field";

const UPDATE_USER = gql`
  mutation (
    $id: ID!
    $email: String!
    $fname: String!
    $lname: String!
    $mobile: String!
    $company: String!
    $title: String!
  ) {
    updateUser(
      id: $id
      email: $email
      first_name: $fname
      last_name: $lname
      mobile: $mobile
      company_profile_id: $company
      title: $title
    ) {
      id
      email
      first_name
      last_name
      mobile
      company_profile_id
      title
    }
  }
`;

export const MyAccount = () => {
  const [info, setInfo] = useState({
    id: "",
    email: "",
    fname: "",
    lname: "",
    mobile: "",
    company: "",
    title: "",
  });

  const handleChange = (e: any) => {
    const value = e.target.value;
    setInfo({
      ...info,
      [e.target.name]: value,
    });
  };

  const onSubmit = async (e: any) => {
    e.preventDefault();
    await updateInfo({
      variables: {
        id: parseInt(info.id),
        email: info.email ? info.email : null,
        fname: info.fname ? info.fname : null,
        lname: info.lname,
        mobile: info.mobile,
        company: info.company,
        title: info.title,
      },
    });
  };

  const [updateInfo, { data, loading, error }] = useMutation(UPDATE_USER, {
    errorPolicy: "all",
  });

  useEffect(() => {
    if (loading) {
      console.log(loading);
    }
    if (error) {
      console.log(error);
    }
    if (data) {
      console.log(data);
    }
  }, [data, error, loading]);

  return (
    <div className="grid h-screen place-items-center">
      <h1 className="text-3xl font-bold">Update My Account</h1>

      {data && data?.updateUser && (
        <div>
        <p>User ID: {data?.updateUser?.id} has been updated to the following:</p>
        <br></br>
        <ul>
          <li>Email: {data?.updateUser?.email}</li>
          <li>First name: {data?.updateUser?.first_name}</li>
          <li>Last name: {data?.updateUser?.last_name}</li>
          <li>Mobile: {data?.updateUser?.mobile}</li>
          <li>Company: {data?.updateUser?.company_profile_id}</li>
          <li>Title: {data?.updateUser?.title}</li>
        </ul>
        </div>
      )}

      {error && (
        <p>
          Error: {error?.message} {error?.graphQLErrors[0]?.message}
        </p>
      )}

      <div className="border rounded-lg p-6 bg-secondary-grey-light-2">
        <form onSubmit={onSubmit}>
          <TextInputField
            handleChange={handleChange}
            label="ID"
            name="id"
            value={info.id}
          />
          <TextInputField
            handleChange={handleChange}
            label="Email"
            name="email"
            value={info.email}
          />
          <TextInputField
            handleChange={handleChange}
            label="First name"
            name="fname"
            value={info.fname}
          />
          <TextInputField
            handleChange={handleChange}
            label="Last name"
            name="lname"
            value={info.lname}
          />
          <TextInputField
            handleChange={handleChange}
            label="Moble"
            name="mobile"
            value={info.mobile}
          />
          <TextInputField
            handleChange={handleChange}
            label="Company"
            name="company"
            value={info.company}
          />
          <TextInputField
            handleChange={handleChange}
            label="Title"
            name="title"
            value={info.title}
          />
          {/* align button to right */}
          <div className="flex flex-row-reverse">
            <button
              className="w-full mt-4 border border-green-800 bg-green-800 text-white rounded-md px-2 py-1"
              type="submit"
            >
              Update Details
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};
