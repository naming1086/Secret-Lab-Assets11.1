//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DeferredReflections" {
Properties {
_SrcBlend ("", Float) = 1
_DstBlend ("", Float) = 1
}
SubShader {
 Pass {
  Blend Zero Zero, Zero Zero
  ZWrite Off
  GpuProgramID 19311
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_ProbePosition;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _CameraGBufferTexture0;
UNITY_LOCATION(2) uniform  sampler2D _CameraGBufferTexture1;
UNITY_LOCATION(3) uniform  sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(4) uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb8;
vec3 u_xlat10;
float u_xlat27;
float u_xlat28;
float u_xlat31;
bool u_xlatb31;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2 = texture(_CameraDepthTexture, u_xlat1.xy);
    u_xlat27 = _ZBufferParams.x * u_xlat2.x + _ZBufferParams.y;
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2 = texture(_CameraGBufferTexture0, u_xlat1.xy);
    u_xlat3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat1 = texture(_CameraGBufferTexture2, u_xlat1.xy);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat27 = max(u_xlat3.y, u_xlat3.x);
    u_xlat27 = max(u_xlat3.z, u_xlat27);
    u_xlat27 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat3.w) + 1.0;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat1.xyz * (-u_xlat4.xxx) + u_xlat2.xyz;
    u_xlatb31 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb31){
        u_xlat5.xyz = unity_SpecCube0_BoxMin.xyz + (-unity_SpecCube1_ProbePosition.www);
        u_xlat6.xyz = unity_SpecCube0_BoxMax.xyz + unity_SpecCube1_ProbePosition.www;
        u_xlat31 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat7.xyz = vec3(u_xlat31) * u_xlat4.xyz;
        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat7.xyz;
        u_xlat5.xyz = (-u_xlat0.xyz) + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat7.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat5.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat31 = min(u_xlat5.y, u_xlat5.x);
        u_xlat31 = min(u_xlat5.z, u_xlat31);
        u_xlat5.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat31) + u_xlat5.xyz;
    }
    u_xlat31 = (-u_xlat28) * 0.699999988 + 1.70000005;
    u_xlat31 = u_xlat28 * u_xlat31;
    u_xlat31 = u_xlat31 * 6.0;
    u_xlat4 = textureLod(unity_SpecCube0, u_xlat4.xyz, u_xlat31);
    u_xlat31 = u_xlat4.w + -1.0;
    u_xlat31 = unity_SpecCube0_HDR.w * u_xlat31 + 1.0;
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * unity_SpecCube0_HDR.y;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * unity_SpecCube0_HDR.x;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat4.xyz = u_xlat2.www * u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat10.x = u_xlat28 * u_xlat28;
    u_xlat10.x = max(u_xlat10.x, 0.00200000009);
    u_xlat10.x = u_xlat10.x * u_xlat10.x + 1.0;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat27 = (-u_xlat27) + 1.0;
    u_xlat27 = u_xlat27 + u_xlat3.w;
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat10.xyz = u_xlat4.xyz * u_xlat10.xxx;
    u_xlat1.x = -abs(u_xlat1.x) + 1.0;
    u_xlat2.x = u_xlat1.x * u_xlat1.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat2.xyz = (-u_xlat3.xyz) + vec3(u_xlat27);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat3.xyz;
    SV_Target0.xyz = u_xlat10.xyz * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-unity_SpecCube0_BoxMax.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / unity_SpecCube1_ProbePosition.w;
    SV_Target0.w = (-u_xlat0.x) + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %102 %169 %175 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 102 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate vs_TEXCOORD1 Location 175 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                              %84 = OpTypePointer Private %6 
                                          u32 %87 = OpConstant 0 
                                              %88 = OpTypePointer Uniform %6 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 3 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %103 = OpTypeVector %6 2 
                                         f32 %158 = OpConstant 3.674022E-40 
                                         f32 %159 = OpConstant 3.674022E-40 
                                       f32_3 %160 = OpConstantComposite %158 %158 %159 
                                             %168 = OpTypePointer Input %94 
                                Input f32_3* %169 = OpVariable Input 
                                             %174 = OpTypePointer Output %94 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %176 = OpConstant 4 
                                             %186 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                 Private f32* %85 = OpAccessChain %49 %76 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %89 = OpAccessChain %21 %28 %87 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %86 %90 
                                 Private f32* %92 = OpAccessChain %49 %76 
                                                      OpStore %92 %91 
                                        f32_4 %95 = OpLoad %49 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 3 1 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %93 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 5 6 
                                                      OpStore %93 %101 
                                       f32_4 %104 = OpLoad %49 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_4 %106 = OpLoad vs_TEXCOORD0 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %107 
                                       f32_4 %108 = OpLoad %93 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 2 
                                       f32_4 %110 = OpLoad %93 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 3 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad vs_TEXCOORD0 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 1 1 1 
                              Uniform f32_4* %117 = OpAccessChain %21 %36 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %49 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %49 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %36 %28 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %49 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %49 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %49 %133 
                              Uniform f32_4* %134 = OpAccessChain %21 %36 %36 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %49 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %21 %36 %45 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %9 %155 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %49 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %49 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFNegate %165 
                                       f32_3 %167 = OpFMul %166 %160 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFAdd %167 %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %9 %173 
                                Uniform f32* %177 = OpAccessChain %21 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %49 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore vs_TEXCOORD1 %185 
                                 Output f32* %187 = OpAccessChain %80 %28 %76 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 568
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %24 %40 %502 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpMemberDecorate %14 8 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 24 
                                                      OpDecorate vs_TEXCOORD0 Location 40 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %125 DescriptorSet 125 
                                                      OpDecorate %125 Binding 125 
                                                      OpDecorate %127 DescriptorSet 127 
                                                      OpDecorate %127 Binding 127 
                                                      OpDecorate %135 DescriptorSet 135 
                                                      OpDecorate %135 Binding 135 
                                                      OpDecorate %137 DescriptorSet 137 
                                                      OpDecorate %137 Binding 137 
                                                      OpDecorate %143 DescriptorSet 143 
                                                      OpDecorate %143 Binding 143 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %385 DescriptorSet 385 
                                                      OpDecorate %385 Binding 385 
                                                      OpDecorate %387 DescriptorSet 387 
                                                      OpDecorate %387 Binding 387 
                                                      OpDecorate %502 Location 502 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %7 %12 
                                              %14 = OpTypeStruct %10 %7 %7 %13 %7 %7 %7 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_3; f32_4; f32_4; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          u32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %6 
                                              %23 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %25 = OpTypePointer Input %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                              %41 = OpTypeVector %6 2 
                                 Private f32* %49 = OpVariable Private 
                                              %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %51 = OpTypePointer UniformConstant %50 
         UniformConstant read_only Texture2D* %52 = OpVariable UniformConstant 
                                              %54 = OpTypeSampler 
                                              %55 = OpTypePointer UniformConstant %54 
                     UniformConstant sampler* %56 = OpVariable UniformConstant 
                                              %58 = OpTypeSampledImage %50 
                                          i32 %64 = OpConstant 2 
                                          u32 %69 = OpConstant 1 
                                          f32 %73 = OpConstant 3.674022E-40 
                               Private f32_4* %83 = OpVariable Private 
                                          i32 %86 = OpConstant 3 
                                              %87 = OpTypePointer Uniform %7 
                                          i32 %94 = OpConstant 0 
        UniformConstant read_only Texture2D* %125 = OpVariable UniformConstant 
                    UniformConstant sampler* %127 = OpVariable UniformConstant 
                                         u32 %133 = OpConstant 3 
        UniformConstant read_only Texture2D* %135 = OpVariable UniformConstant 
                    UniformConstant sampler* %137 = OpVariable UniformConstant 
        UniformConstant read_only Texture2D* %143 = OpVariable UniformConstant 
                    UniformConstant sampler* %145 = OpVariable UniformConstant 
                                         f32 %156 = OpConstant 3.674022E-40 
                                       f32_3 %157 = OpConstantComposite %156 %156 %156 
                                         f32 %159 = OpConstant 3.674022E-40 
                                       f32_3 %160 = OpConstantComposite %159 %159 %159 
                                Private f32* %164 = OpVariable Private 
                                             %179 = OpTypePointer Private %10 
                              Private f32_3* %180 = OpVariable Private 
                                             %183 = OpTypePointer Uniform %10 
                                Private f32* %209 = OpVariable Private 
                              Private f32_4* %214 = OpVariable Private 
                                             %236 = OpTypeBool 
                                             %237 = OpTypePointer Private %236 
                               Private bool* %238 = OpVariable Private 
                                         f32 %239 = OpConstant 3.674022E-40 
                                         i32 %240 = OpConstant 6 
                              Private f32_3* %247 = OpVariable Private 
                                         i32 %248 = OpConstant 5 
                                         i32 %252 = OpConstant 8 
                              Private f32_3* %258 = OpVariable Private 
                                         i32 %259 = OpConstant 4 
                                Private f32* %267 = OpVariable Private 
                              Private f32_3* %275 = OpVariable Private 
                                             %297 = OpTypeVector %236 3 
                                             %298 = OpTypePointer Private %297 
                             Private bool_3* %299 = OpVariable Private 
                                       f32_4 %300 = OpConstantComposite %239 %239 %239 %239 
                                             %303 = OpTypeVector %236 4 
                                             %306 = OpTypePointer Function %10 
                                             %311 = OpTypePointer Function %6 
                                         f32 %373 = OpConstant 3.674022E-40 
                                         f32 %375 = OpConstant 3.674022E-40 
                                         f32 %381 = OpConstant 3.674022E-40 
                                             %383 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %384 = OpTypePointer UniformConstant %383 
      UniformConstant read_only TextureCube* %385 = OpVariable UniformConstant 
                    UniformConstant sampler* %387 = OpVariable UniformConstant 
                                             %389 = OpTypeSampledImage %383 
                                         i32 %398 = OpConstant 7 
                                         f32 %441 = OpConstant 3.674022E-40 
                                Private f32* %455 = OpVariable Private 
                                Private f32* %476 = OpVariable Private 
                                             %501 = OpTypePointer Output %7 
                               Output f32_4* %502 = OpVariable Output 
                                       f32_3 %537 = OpConstantComposite %239 %239 %239 
                                             %561 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %307 = OpVariable Function 
                               Function f32* %312 = OpVariable Function 
                               Function f32* %324 = OpVariable Function 
                               Function f32* %336 = OpVariable Function 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                   Input f32* %26 = OpAccessChain vs_TEXCOORD1 %19 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %22 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 0 0 
                                        f32_3 %34 = OpLoad vs_TEXCOORD1 
                                        f32_3 %35 = OpFMul %33 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                      OpStore %9 %37 
                                        f32_4 %42 = OpLoad vs_TEXCOORD0 
                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                        f32_4 %44 = OpLoad vs_TEXCOORD0 
                                        f32_2 %45 = OpVectorShuffle %44 %44 3 3 
                                        f32_2 %46 = OpFDiv %43 %45 
                                        f32_4 %47 = OpLoad %38 
                                        f32_4 %48 = OpVectorShuffle %47 %46 4 5 2 3 
                                                      OpStore %38 %48 
                          read_only Texture2D %53 = OpLoad %52 
                                      sampler %57 = OpLoad %56 
                   read_only Texture2DSampled %59 = OpSampledImage %53 %57 
                                        f32_4 %60 = OpLoad %38 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %63 = OpCompositeExtract %62 0 
                                                      OpStore %49 %63 
                                 Uniform f32* %65 = OpAccessChain %16 %64 %29 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpLoad %49 
                                          f32 %68 = OpFMul %66 %67 
                                 Uniform f32* %70 = OpAccessChain %16 %64 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFAdd %68 %71 
                                                      OpStore %49 %72 
                                          f32 %74 = OpLoad %49 
                                          f32 %75 = OpFDiv %73 %74 
                                                      OpStore %49 %75 
                                          f32 %76 = OpLoad %49 
                                        f32_3 %77 = OpCompositeConstruct %76 %76 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                        f32_3 %80 = OpFMul %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpVectorShuffle %81 %80 4 5 6 3 
                                                      OpStore %9 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 1 1 1 
                               Uniform f32_4* %88 = OpAccessChain %16 %86 %18 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFMul %85 %90 
                                        f32_4 %92 = OpLoad %83 
                                        f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                                      OpStore %83 %93 
                               Uniform f32_4* %95 = OpAccessChain %16 %86 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_4 %98 = OpLoad %9 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 0 0 
                                       f32_3 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %83 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                                       f32_3 %103 = OpFAdd %100 %102 
                                       f32_4 %104 = OpLoad %9 
                                       f32_4 %105 = OpVectorShuffle %104 %103 4 5 2 6 
                                                      OpStore %9 %105 
                              Uniform f32_4* %106 = OpAccessChain %16 %86 %64 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %9 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 3 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %9 %116 
                                       f32_4 %117 = OpLoad %9 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                              Uniform f32_4* %119 = OpAccessChain %16 %86 %86 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFAdd %118 %121 
                                       f32_4 %123 = OpLoad %9 
                                       f32_4 %124 = OpVectorShuffle %123 %122 4 5 6 3 
                                                      OpStore %9 %124 
                         read_only Texture2D %126 = OpLoad %125 
                                     sampler %128 = OpLoad %127 
                  read_only Texture2DSampled %129 = OpSampledImage %126 %128 
                                       f32_4 %130 = OpLoad %38 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_4 %132 = OpImageSampleImplicitLod %129 %131 
                                         f32 %134 = OpCompositeExtract %132 3 
                                                      OpStore %49 %134 
                         read_only Texture2D %136 = OpLoad %135 
                                     sampler %138 = OpLoad %137 
                  read_only Texture2DSampled %139 = OpSampledImage %136 %138 
                                       f32_4 %140 = OpLoad %38 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %83 %142 
                         read_only Texture2D %144 = OpLoad %143 
                                     sampler %146 = OpLoad %145 
                  read_only Texture2DSampled %147 = OpSampledImage %144 %146 
                                       f32_4 %148 = OpLoad %38 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                       f32_4 %150 = OpImageSampleImplicitLod %147 %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_4 %152 = OpLoad %38 
                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
                                                      OpStore %38 %153 
                                       f32_4 %154 = OpLoad %38 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %158 = OpFMul %155 %157 
                                       f32_3 %161 = OpFAdd %158 %160 
                                       f32_4 %162 = OpLoad %38 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %38 %163 
                                       f32_4 %165 = OpLoad %38 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_4 %167 = OpLoad %38 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                         f32 %169 = OpDot %166 %168 
                                                      OpStore %164 %169 
                                         f32 %170 = OpLoad %164 
                                         f32 %171 = OpExtInst %1 32 %170 
                                                      OpStore %164 %171 
                                         f32 %172 = OpLoad %164 
                                       f32_3 %173 = OpCompositeConstruct %172 %172 %172 
                                       f32_4 %174 = OpLoad %38 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFMul %173 %175 
                                       f32_4 %177 = OpLoad %38 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %38 %178 
                                       f32_4 %181 = OpLoad %9 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                              Uniform f32_3* %184 = OpAccessChain %16 %94 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFNegate %185 
                                       f32_3 %187 = OpFAdd %182 %186 
                                                      OpStore %180 %187 
                                       f32_3 %188 = OpLoad %180 
                                       f32_3 %189 = OpLoad %180 
                                         f32 %190 = OpDot %188 %189 
                                                      OpStore %164 %190 
                                         f32 %191 = OpLoad %164 
                                         f32 %192 = OpExtInst %1 32 %191 
                                                      OpStore %164 %192 
                                         f32 %193 = OpLoad %164 
                                       f32_3 %194 = OpCompositeConstruct %193 %193 %193 
                                       f32_3 %195 = OpLoad %180 
                                       f32_3 %196 = OpFMul %194 %195 
                                                      OpStore %180 %196 
                                Private f32* %197 = OpAccessChain %83 %69 
                                         f32 %198 = OpLoad %197 
                                Private f32* %199 = OpAccessChain %83 %29 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpExtInst %1 40 %198 %200 
                                                      OpStore %164 %201 
                                Private f32* %202 = OpAccessChain %83 %19 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpLoad %164 
                                         f32 %205 = OpExtInst %1 40 %203 %204 
                                                      OpStore %164 %205 
                                         f32 %206 = OpLoad %164 
                                         f32 %207 = OpFNegate %206 
                                         f32 %208 = OpFAdd %207 %73 
                                                      OpStore %164 %208 
                                Private f32* %210 = OpAccessChain %83 %133 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFNegate %211 
                                         f32 %213 = OpFAdd %212 %73 
                                                      OpStore %209 %213 
                                       f32_3 %215 = OpLoad %180 
                                       f32_4 %216 = OpLoad %38 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                         f32 %218 = OpDot %215 %217 
                                Private f32* %219 = OpAccessChain %214 %29 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %214 %29 
                                         f32 %221 = OpLoad %220 
                                Private f32* %222 = OpAccessChain %214 %29 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFAdd %221 %223 
                                Private f32* %225 = OpAccessChain %214 %29 
                                                      OpStore %225 %224 
                                       f32_4 %226 = OpLoad %38 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                       f32_4 %228 = OpLoad %214 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 0 0 
                                       f32_3 %230 = OpFNegate %229 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_3 %232 = OpLoad %180 
                                       f32_3 %233 = OpFAdd %231 %232 
                                       f32_4 %234 = OpLoad %214 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
                                                      OpStore %214 %235 
                                Uniform f32* %241 = OpAccessChain %16 %240 %133 
                                         f32 %242 = OpLoad %241 
                                        bool %243 = OpFOrdLessThan %239 %242 
                                                      OpStore %238 %243 
                                        bool %244 = OpLoad %238 
                                                      OpSelectionMerge %246 None 
                                                      OpBranchConditional %244 %245 %246 
                                             %245 = OpLabel 
                              Uniform f32_4* %249 = OpAccessChain %16 %248 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %253 = OpAccessChain %16 %252 
                                       f32_4 %254 = OpLoad %253 
                                       f32_3 %255 = OpVectorShuffle %254 %254 3 3 3 
                                       f32_3 %256 = OpFNegate %255 
                                       f32_3 %257 = OpFAdd %251 %256 
                                                      OpStore %247 %257 
                              Uniform f32_4* %260 = OpAccessChain %16 %259 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %16 %252 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 3 3 3 
                                       f32_3 %266 = OpFAdd %262 %265 
                                                      OpStore %258 %266 
                                       f32_4 %268 = OpLoad %214 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_4 %270 = OpLoad %214 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                         f32 %272 = OpDot %269 %271 
                                                      OpStore %267 %272 
                                         f32 %273 = OpLoad %267 
                                         f32 %274 = OpExtInst %1 32 %273 
                                                      OpStore %267 %274 
                                         f32 %276 = OpLoad %267 
                                       f32_3 %277 = OpCompositeConstruct %276 %276 %276 
                                       f32_4 %278 = OpLoad %214 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %277 %279 
                                                      OpStore %275 %280 
                                       f32_4 %281 = OpLoad %9 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                       f32_3 %283 = OpFNegate %282 
                                       f32_3 %284 = OpLoad %258 
                                       f32_3 %285 = OpFAdd %283 %284 
                                                      OpStore %258 %285 
                                       f32_3 %286 = OpLoad %258 
                                       f32_3 %287 = OpLoad %275 
                                       f32_3 %288 = OpFDiv %286 %287 
                                                      OpStore %258 %288 
                                       f32_4 %289 = OpLoad %9 
                                       f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
                                       f32_3 %291 = OpFNegate %290 
                                       f32_3 %292 = OpLoad %247 
                                       f32_3 %293 = OpFAdd %291 %292 
                                                      OpStore %247 %293 
                                       f32_3 %294 = OpLoad %247 
                                       f32_3 %295 = OpLoad %275 
                                       f32_3 %296 = OpFDiv %294 %295 
                                                      OpStore %247 %296 
                                       f32_3 %301 = OpLoad %275 
                                       f32_4 %302 = OpVectorShuffle %301 %301 0 1 2 0 
                                      bool_4 %304 = OpFOrdLessThan %300 %302 
                                      bool_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                                      OpStore %299 %305 
                                       f32_3 %308 = OpLoad %247 
                                                      OpStore %307 %308 
                               Private bool* %309 = OpAccessChain %299 %29 
                                        bool %310 = OpLoad %309 
                                                      OpSelectionMerge %314 None 
                                                      OpBranchConditional %310 %313 %317 
                                             %313 = OpLabel 
                                Private f32* %315 = OpAccessChain %258 %29 
                                         f32 %316 = OpLoad %315 
                                                      OpStore %312 %316 
                                                      OpBranch %314 
                                             %317 = OpLabel 
                                Private f32* %318 = OpAccessChain %247 %29 
                                         f32 %319 = OpLoad %318 
                                                      OpStore %312 %319 
                                                      OpBranch %314 
                                             %314 = OpLabel 
                                         f32 %320 = OpLoad %312 
                               Function f32* %321 = OpAccessChain %307 %29 
                                                      OpStore %321 %320 
                               Private bool* %322 = OpAccessChain %299 %69 
                                        bool %323 = OpLoad %322 
                                                      OpSelectionMerge %326 None 
                                                      OpBranchConditional %323 %325 %329 
                                             %325 = OpLabel 
                                Private f32* %327 = OpAccessChain %258 %69 
                                         f32 %328 = OpLoad %327 
                                                      OpStore %324 %328 
                                                      OpBranch %326 
                                             %329 = OpLabel 
                                Private f32* %330 = OpAccessChain %247 %69 
                                         f32 %331 = OpLoad %330 
                                                      OpStore %324 %331 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         f32 %332 = OpLoad %324 
                               Function f32* %333 = OpAccessChain %307 %69 
                                                      OpStore %333 %332 
                               Private bool* %334 = OpAccessChain %299 %19 
                                        bool %335 = OpLoad %334 
                                                      OpSelectionMerge %338 None 
                                                      OpBranchConditional %335 %337 %341 
                                             %337 = OpLabel 
                                Private f32* %339 = OpAccessChain %258 %19 
                                         f32 %340 = OpLoad %339 
                                                      OpStore %336 %340 
                                                      OpBranch %338 
                                             %341 = OpLabel 
                                Private f32* %342 = OpAccessChain %247 %19 
                                         f32 %343 = OpLoad %342 
                                                      OpStore %336 %343 
                                                      OpBranch %338 
                                             %338 = OpLabel 
                                         f32 %344 = OpLoad %336 
                               Function f32* %345 = OpAccessChain %307 %19 
                                                      OpStore %345 %344 
                                       f32_3 %346 = OpLoad %307 
                                                      OpStore %247 %346 
                                Private f32* %347 = OpAccessChain %247 %69 
                                         f32 %348 = OpLoad %347 
                                Private f32* %349 = OpAccessChain %247 %29 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpExtInst %1 37 %348 %350 
                                                      OpStore %267 %351 
                                Private f32* %352 = OpAccessChain %247 %19 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpLoad %267 
                                         f32 %355 = OpExtInst %1 37 %353 %354 
                                                      OpStore %267 %355 
                                       f32_4 %356 = OpLoad %9 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                              Uniform f32_4* %358 = OpAccessChain %16 %240 
                                       f32_4 %359 = OpLoad %358 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
                                       f32_3 %361 = OpFNegate %360 
                                       f32_3 %362 = OpFAdd %357 %361 
                                                      OpStore %247 %362 
                                       f32_3 %363 = OpLoad %275 
                                         f32 %364 = OpLoad %267 
                                       f32_3 %365 = OpCompositeConstruct %364 %364 %364 
                                       f32_3 %366 = OpFMul %363 %365 
                                       f32_3 %367 = OpLoad %247 
                                       f32_3 %368 = OpFAdd %366 %367 
                                       f32_4 %369 = OpLoad %214 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %214 %370 
                                                      OpBranch %246 
                                             %246 = OpLabel 
                                         f32 %371 = OpLoad %209 
                                         f32 %372 = OpFNegate %371 
                                         f32 %374 = OpFMul %372 %373 
                                         f32 %376 = OpFAdd %374 %375 
                                                      OpStore %267 %376 
                                         f32 %377 = OpLoad %209 
                                         f32 %378 = OpLoad %267 
                                         f32 %379 = OpFMul %377 %378 
                                                      OpStore %267 %379 
                                         f32 %380 = OpLoad %267 
                                         f32 %382 = OpFMul %380 %381 
                                                      OpStore %267 %382 
                       read_only TextureCube %386 = OpLoad %385 
                                     sampler %388 = OpLoad %387 
                read_only TextureCubeSampled %390 = OpSampledImage %386 %388 
                                       f32_4 %391 = OpLoad %214 
                                       f32_3 %392 = OpVectorShuffle %391 %391 0 1 2 
                                         f32 %393 = OpLoad %267 
                                       f32_4 %394 = OpImageSampleExplicitLod %390 %392 Lod %7 
                                                      OpStore %214 %394 
                                Private f32* %395 = OpAccessChain %214 %133 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFAdd %396 %159 
                                                      OpStore %267 %397 
                                Uniform f32* %399 = OpAccessChain %16 %398 %133 
                                         f32 %400 = OpLoad %399 
                                         f32 %401 = OpLoad %267 
                                         f32 %402 = OpFMul %400 %401 
                                         f32 %403 = OpFAdd %402 %73 
                                                      OpStore %267 %403 
                                         f32 %404 = OpLoad %267 
                                         f32 %405 = OpExtInst %1 30 %404 
                                                      OpStore %267 %405 
                                         f32 %406 = OpLoad %267 
                                Uniform f32* %407 = OpAccessChain %16 %398 %69 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpFMul %406 %408 
                                                      OpStore %267 %409 
                                         f32 %410 = OpLoad %267 
                                         f32 %411 = OpExtInst %1 29 %410 
                                                      OpStore %267 %411 
                                         f32 %412 = OpLoad %267 
                                Uniform f32* %413 = OpAccessChain %16 %398 %29 
                                         f32 %414 = OpLoad %413 
                                         f32 %415 = OpFMul %412 %414 
                                                      OpStore %267 %415 
                                       f32_4 %416 = OpLoad %214 
                                       f32_3 %417 = OpVectorShuffle %416 %416 0 1 2 
                                         f32 %418 = OpLoad %267 
                                       f32_3 %419 = OpCompositeConstruct %418 %418 %418 
                                       f32_3 %420 = OpFMul %417 %419 
                                       f32_4 %421 = OpLoad %214 
                                       f32_4 %422 = OpVectorShuffle %421 %420 4 5 6 3 
                                                      OpStore %214 %422 
                                         f32 %423 = OpLoad %49 
                                       f32_3 %424 = OpCompositeConstruct %423 %423 %423 
                                       f32_4 %425 = OpLoad %214 
                                       f32_3 %426 = OpVectorShuffle %425 %425 0 1 2 
                                       f32_3 %427 = OpFMul %424 %426 
                                       f32_4 %428 = OpLoad %214 
                                       f32_4 %429 = OpVectorShuffle %428 %427 4 5 6 3 
                                                      OpStore %214 %429 
                                       f32_4 %430 = OpLoad %38 
                                       f32_3 %431 = OpVectorShuffle %430 %430 0 1 2 
                                       f32_3 %432 = OpLoad %180 
                                       f32_3 %433 = OpFNegate %432 
                                         f32 %434 = OpDot %431 %433 
                                                      OpStore %49 %434 
                                         f32 %435 = OpLoad %209 
                                         f32 %436 = OpLoad %209 
                                         f32 %437 = OpFMul %435 %436 
                                Private f32* %438 = OpAccessChain %38 %29 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %38 %29 
                                         f32 %440 = OpLoad %439 
                                         f32 %442 = OpExtInst %1 40 %440 %441 
                                Private f32* %443 = OpAccessChain %38 %29 
                                                      OpStore %443 %442 
                                Private f32* %444 = OpAccessChain %38 %29 
                                         f32 %445 = OpLoad %444 
                                Private f32* %446 = OpAccessChain %38 %29 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpFMul %445 %447 
                                         f32 %449 = OpFAdd %448 %73 
                                Private f32* %450 = OpAccessChain %38 %29 
                                                      OpStore %450 %449 
                                Private f32* %451 = OpAccessChain %38 %29 
                                         f32 %452 = OpLoad %451 
                                         f32 %453 = OpFDiv %73 %452 
                                Private f32* %454 = OpAccessChain %38 %29 
                                                      OpStore %454 %453 
                                         f32 %456 = OpLoad %164 
                                         f32 %457 = OpFNegate %456 
                                Private f32* %458 = OpAccessChain %83 %133 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFAdd %457 %459 
                                                      OpStore %455 %460 
                                         f32 %461 = OpLoad %455 
                                         f32 %462 = OpFAdd %461 %73 
                                                      OpStore %455 %462 
                                         f32 %463 = OpLoad %455 
                                         f32 %464 = OpExtInst %1 43 %463 %239 %73 
                                                      OpStore %455 %464 
                                       f32_4 %465 = OpLoad %214 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_4 %467 = OpLoad %38 
                                       f32_3 %468 = OpVectorShuffle %467 %467 0 0 0 
                                       f32_3 %469 = OpFMul %466 %468 
                                       f32_4 %470 = OpLoad %38 
                                       f32_4 %471 = OpVectorShuffle %470 %469 4 1 5 6 
                                                      OpStore %38 %471 
                                         f32 %472 = OpLoad %49 
                                         f32 %473 = OpExtInst %1 4 %472 
                                         f32 %474 = OpFNegate %473 
                                         f32 %475 = OpFAdd %474 %73 
                                                      OpStore %49 %475 
                                         f32 %477 = OpLoad %49 
                                         f32 %478 = OpLoad %49 
                                         f32 %479 = OpFMul %477 %478 
                                                      OpStore %476 %479 
                                         f32 %480 = OpLoad %476 
                                         f32 %481 = OpLoad %476 
                                         f32 %482 = OpFMul %480 %481 
                                                      OpStore %476 %482 
                                         f32 %483 = OpLoad %49 
                                         f32 %484 = OpLoad %476 
                                         f32 %485 = OpFMul %483 %484 
                                                      OpStore %49 %485 
                                       f32_4 %486 = OpLoad %83 
                                       f32_3 %487 = OpVectorShuffle %486 %486 0 1 2 
                                       f32_3 %488 = OpFNegate %487 
                                         f32 %489 = OpLoad %455 
                                       f32_3 %490 = OpCompositeConstruct %489 %489 %489 
                                       f32_3 %491 = OpFAdd %488 %490 
                                                      OpStore %180 %491 
                                         f32 %492 = OpLoad %49 
                                       f32_3 %493 = OpCompositeConstruct %492 %492 %492 
                                       f32_3 %494 = OpLoad %180 
                                       f32_3 %495 = OpFMul %493 %494 
                                       f32_4 %496 = OpLoad %83 
                                       f32_3 %497 = OpVectorShuffle %496 %496 0 1 2 
                                       f32_3 %498 = OpFAdd %495 %497 
                                       f32_4 %499 = OpLoad %83 
                                       f32_4 %500 = OpVectorShuffle %499 %498 4 5 6 3 
                                                      OpStore %83 %500 
                                       f32_4 %503 = OpLoad %38 
                                       f32_3 %504 = OpVectorShuffle %503 %503 0 2 3 
                                       f32_4 %505 = OpLoad %83 
                                       f32_3 %506 = OpVectorShuffle %505 %505 0 1 2 
                                       f32_3 %507 = OpFMul %504 %506 
                                       f32_4 %508 = OpLoad %502 
                                       f32_4 %509 = OpVectorShuffle %508 %507 4 5 6 3 
                                                      OpStore %502 %509 
                                       f32_4 %510 = OpLoad %9 
                                       f32_3 %511 = OpVectorShuffle %510 %510 0 1 2 
                              Uniform f32_4* %512 = OpAccessChain %16 %259 
                                       f32_4 %513 = OpLoad %512 
                                       f32_3 %514 = OpVectorShuffle %513 %513 0 1 2 
                                       f32_3 %515 = OpFNegate %514 
                                       f32_3 %516 = OpFAdd %511 %515 
                                       f32_4 %517 = OpLoad %38 
                                       f32_4 %518 = OpVectorShuffle %517 %516 4 5 6 3 
                                                      OpStore %38 %518 
                                       f32_4 %519 = OpLoad %9 
                                       f32_3 %520 = OpVectorShuffle %519 %519 0 1 2 
                                       f32_3 %521 = OpFNegate %520 
                              Uniform f32_4* %522 = OpAccessChain %16 %248 
                                       f32_4 %523 = OpLoad %522 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 1 2 
                                       f32_3 %525 = OpFAdd %521 %524 
                                       f32_4 %526 = OpLoad %9 
                                       f32_4 %527 = OpVectorShuffle %526 %525 4 5 6 3 
                                                      OpStore %9 %527 
                                       f32_4 %528 = OpLoad %9 
                                       f32_3 %529 = OpVectorShuffle %528 %528 0 1 2 
                                       f32_4 %530 = OpLoad %38 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
                                       f32_3 %532 = OpExtInst %1 40 %529 %531 
                                       f32_4 %533 = OpLoad %9 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %9 %534 
                                       f32_4 %535 = OpLoad %9 
                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                       f32_3 %538 = OpExtInst %1 40 %536 %537 
                                       f32_4 %539 = OpLoad %9 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                      OpStore %9 %540 
                                       f32_4 %541 = OpLoad %9 
                                       f32_3 %542 = OpVectorShuffle %541 %541 0 1 2 
                                       f32_4 %543 = OpLoad %9 
                                       f32_3 %544 = OpVectorShuffle %543 %543 0 1 2 
                                         f32 %545 = OpDot %542 %544 
                                Private f32* %546 = OpAccessChain %9 %29 
                                                      OpStore %546 %545 
                                Private f32* %547 = OpAccessChain %9 %29 
                                         f32 %548 = OpLoad %547 
                                         f32 %549 = OpExtInst %1 31 %548 
                                Private f32* %550 = OpAccessChain %9 %29 
                                                      OpStore %550 %549 
                                Private f32* %551 = OpAccessChain %9 %29 
                                         f32 %552 = OpLoad %551 
                                Uniform f32* %553 = OpAccessChain %16 %252 %133 
                                         f32 %554 = OpLoad %553 
                                         f32 %555 = OpFDiv %552 %554 
                                Private f32* %556 = OpAccessChain %9 %29 
                                                      OpStore %556 %555 
                                Private f32* %557 = OpAccessChain %9 %29 
                                         f32 %558 = OpLoad %557 
                                         f32 %559 = OpFNegate %558 
                                         f32 %560 = OpFAdd %559 %73 
                                 Output f32* %562 = OpAccessChain %502 %133 
                                                      OpStore %562 %560 
                                 Output f32* %563 = OpAccessChain %502 %133 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpExtInst %1 43 %564 %239 %73 
                                 Output f32* %566 = OpAccessChain %502 %133 
                                                      OpStore %566 %565 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
 Pass {
  Blend Zero Zero, Zero Zero
  ZTest Always
  ZWrite Off
  GpuProgramID 113442
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _CameraReflectionsTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy);
    SV_Target0.xyz = exp2((-u_xlat0.xyz));
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 40
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %28 Location 28 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %35 = OpTypeInt 32 0 
                                 u32 %36 = OpConstant 3 
                                     %37 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_3 %30 = OpFNegate %29 
                               f32_3 %31 = OpExtInst %1 29 %30 
                               f32_4 %32 = OpLoad %28 
                               f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                             OpStore %28 %33 
                         Output f32* %38 = OpAccessChain %28 %36 
                                             OpStore %38 %34 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _CameraReflectionsTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_HDR_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 38
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %28 Location 28 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %32 = OpConstant 3.674022E-40 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %35 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_4 %30 = OpLoad %28 
                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                             OpStore %28 %31 
                         Output f32* %36 = OpAccessChain %28 %34 
                                             OpStore %36 %32 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
SubProgram "d3d11 " {
Keywords { "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
}
}
}
}