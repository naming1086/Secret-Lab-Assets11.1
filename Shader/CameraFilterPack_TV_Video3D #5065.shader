//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_Video3D" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 44475
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD0.xyx * _MainTex_ST.xyx + _MainTex_ST.zwz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(500.0, 500.0, 500.0);
    u_xlat0.xyz = floor(u_xlat0.xyz);
    u_xlat1.xy = u_xlat0.xy * vec2(0.00200000009, 0.00200000009);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<64 ; u_xlati_loop_1++)
    {
        u_xlat18 = float(u_xlati_loop_1);
        u_xlat18 = (-u_xlat18) * 0.00200000009 + u_xlat1.y;
        u_xlat1.w = u_xlat18 + u_xlat18;
        u_xlat3.xy = u_xlat1.xw + vec2(0.75, 0.375);
        u_xlat13.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006);
        u_xlat4 = texture(_MainTex, u_xlat13.xy);
        u_xlat3.z = u_xlat4.x * 0.200000003;
        u_xlat18 = u_xlat4.x * 0.200000003 + u_xlat18;
        u_xlatb18 = u_xlat1.y<u_xlat18;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat2.xyz;
    }
    u_xlat0.xw = u_xlat2.xy * vec2(0.400000006, 0.400000006);
    u_xlat1 = texture(_MainTex, u_xlat0.xw);
    u_xlat3 = u_xlat2.xyxy + vec4(0.0, 0.00400000019, -0.0, -0.00400000019);
    u_xlat3 = u_xlat3 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
    u_xlat4 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat0.x = u_xlat3.x * 0.200000003;
    u_xlat0.x = u_xlat4.x * 0.200000003 + (-u_xlat0.x);
    u_xlat3.y = max(u_xlat0.x, 0.00300000003);
    u_xlat4 = u_xlat2.xyxy + vec4(0.00400000019, 0.0, -0.00400000019, -0.0);
    u_xlat4 = u_xlat4 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
    u_xlat5 = texture(_MainTex, u_xlat4.xy);
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat0.x = u_xlat4.x * 0.200000003;
    u_xlat0.x = u_xlat5.x * 0.200000003 + (-u_xlat0.x);
    u_xlat3.x = max(u_xlat0.x, 0.00300000003);
    u_xlat3.xy = u_xlat3.xy * vec2(0.00800000038, 0.00800000038);
    u_xlat3.z = -6.40000071e-05;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xw = u_xlat0.xx * u_xlat3.xz;
    u_xlat0.x = dot(u_xlat0.xw, vec2(0.707106769, -0.707106769));
    u_xlat18 = max(u_xlat0.x, 0.200000003);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat18 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat18 + 1.0;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xy = u_xlat0.zy * vec2(0.00160000008, 0.00200000009) + vec2(-0.400000006, 0.0);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat6 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.800000012;
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat6) + u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 %88 %89 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                              OpDecorate %88 Location 88 
                                              OpDecorate %89 Location 89 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                        Output f32_4* %88 = OpVariable Output 
                         Input f32_4* %89 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore vs_TEXCOORD0 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                                f32_4 %90 = OpLoad %89 
                                              OpStore %88 %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %78 %28 %74 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 344
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %328 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 12 
                                              OpMemberDecorate %16 0 Offset 16 
                                              OpDecorate %16 Block 
                                              OpDecorate %18 DescriptorSet 18 
                                              OpDecorate %18 Binding 18 
                                              OpDecorate %106 DescriptorSet 106 
                                              OpDecorate %106 Binding 106 
                                              OpDecorate %110 DescriptorSet 110 
                                              OpDecorate %110 Binding 110 
                                              OpDecorate %328 Location 328 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 2 
                                      %11 = OpTypePointer Input %10 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %13 = OpTypeVector %6 3 
                                      %16 = OpTypeStruct %7 
                                      %17 = OpTypePointer Uniform %16 
             Uniform struct {f32_4;}* %18 = OpVariable Uniform 
                                      %19 = OpTypeInt 32 1 
                                  i32 %20 = OpConstant 0 
                                      %21 = OpTypePointer Uniform %7 
                                  f32 %34 = OpConstant 3.674022E-40 
                                f32_3 %35 = OpConstantComposite %34 %34 %34 
                       Private f32_4* %44 = OpVariable Private 
                                  f32 %47 = OpConstant 3.674022E-40 
                                f32_2 %48 = OpConstantComposite %47 %47 
                                      %52 = OpTypePointer Private %13 
                       Private f32_3* %53 = OpVariable Private 
                                  f32 %54 = OpConstant 3.674022E-40 
                                      %55 = OpTypeInt 32 0 
                                  u32 %56 = OpConstant 0 
                                      %57 = OpTypePointer Private %6 
                                  u32 %59 = OpConstant 1 
                                  u32 %61 = OpConstant 2 
                                      %63 = OpTypePointer Function %19 
                                  i32 %71 = OpConstant 64 
                                      %72 = OpTypeBool 
                         Private f32* %74 = OpVariable Private 
                                  u32 %86 = OpConstant 3 
                       Private f32_4* %88 = OpVariable Private 
                                  f32 %91 = OpConstant 3.674022E-40 
                                  f32 %92 = OpConstant 3.674022E-40 
                                f32_2 %93 = OpConstantComposite %91 %92 
                                      %97 = OpTypePointer Private %10 
                       Private f32_2* %98 = OpVariable Private 
                                 f32 %101 = OpConstant 3.674022E-40 
                               f32_2 %102 = OpConstantComposite %101 %101 
                                     %104 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %105 = OpTypePointer UniformConstant %104 
UniformConstant read_only Texture2D* %106 = OpVariable UniformConstant 
                                     %108 = OpTypeSampler 
                                     %109 = OpTypePointer UniformConstant %108 
            UniformConstant sampler* %110 = OpVariable UniformConstant 
                                     %112 = OpTypeSampledImage %104 
                                 f32 %120 = OpConstant 3.674022E-40 
                                     %128 = OpTypePointer Private %72 
                       Private bool* %129 = OpVariable Private 
                                     %135 = OpTypePointer Function %13 
                                 i32 %145 = OpConstant 1 
                                 f32 %163 = OpConstant 3.674022E-40 
                                 f32 %164 = OpConstant 3.674022E-40 
                                 f32 %165 = OpConstant 3.674022E-40 
                               f32_4 %166 = OpConstantComposite %54 %163 %164 %165 
                               f32_4 %169 = OpConstantComposite %101 %101 %101 %101 
                                 f32 %197 = OpConstant 3.674022E-40 
                      Private f32_4* %200 = OpVariable Private 
                               f32_4 %203 = OpConstantComposite %163 %54 %165 %164 
                                 f32 %237 = OpConstant 3.674022E-40 
                               f32_2 %238 = OpConstantComposite %237 %237 
                                 f32 %242 = OpConstant 3.674022E-40 
                                 f32 %263 = OpConstant 3.674022E-40 
                                 f32 %264 = OpConstant 3.674022E-40 
                               f32_2 %265 = OpConstantComposite %263 %264 
                                 f32 %293 = OpConstant 3.674022E-40 
                                 f32 %305 = OpConstant 3.674022E-40 
                               f32_2 %306 = OpConstantComposite %305 %47 
                                 f32 %308 = OpConstant 3.674022E-40 
                               f32_2 %309 = OpConstantComposite %308 %54 
                        Private f32* %317 = OpVariable Private 
                                 f32 %324 = OpConstant 3.674022E-40 
                                     %327 = OpTypePointer Output %7 
                       Output f32_4* %328 = OpVariable Output 
                                     %339 = OpTypePointer Output %6 
                                     %342 = OpTypePointer Private %19 
                        Private i32* %343 = OpVariable Private 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                        Function i32* %64 = OpVariable Function 
                     Function f32_3* %136 = OpVariable Function 
                                f32_2 %14 = OpLoad vs_TEXCOORD0 
                                f32_3 %15 = OpVectorShuffle %14 %14 0 1 0 
                       Uniform f32_4* %22 = OpAccessChain %18 %20 
                                f32_4 %23 = OpLoad %22 
                                f32_3 %24 = OpVectorShuffle %23 %23 0 1 0 
                                f32_3 %25 = OpFMul %15 %24 
                       Uniform f32_4* %26 = OpAccessChain %18 %20 
                                f32_4 %27 = OpLoad %26 
                                f32_3 %28 = OpVectorShuffle %27 %27 2 3 2 
                                f32_3 %29 = OpFAdd %25 %28 
                                f32_4 %30 = OpLoad %9 
                                f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                              OpStore %9 %31 
                                f32_4 %32 = OpLoad %9 
                                f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                f32_3 %36 = OpFMul %33 %35 
                                f32_4 %37 = OpLoad %9 
                                f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
                                              OpStore %9 %38 
                                f32_4 %39 = OpLoad %9 
                                f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                f32_3 %41 = OpExtInst %1 8 %40 
                                f32_4 %42 = OpLoad %9 
                                f32_4 %43 = OpVectorShuffle %42 %41 4 5 6 3 
                                              OpStore %9 %43 
                                f32_4 %45 = OpLoad %9 
                                f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                f32_2 %49 = OpFMul %46 %48 
                                f32_4 %50 = OpLoad %44 
                                f32_4 %51 = OpVectorShuffle %50 %49 4 5 2 3 
                                              OpStore %44 %51 
                         Private f32* %58 = OpAccessChain %53 %56 
                                              OpStore %58 %54 
                         Private f32* %60 = OpAccessChain %53 %59 
                                              OpStore %60 %54 
                         Private f32* %62 = OpAccessChain %53 %61 
                                              OpStore %62 %54 
                                              OpStore %64 %20 
                                              OpBranch %65 
                                      %65 = OpLabel 
                                              OpLoopMerge %67 %68 None 
                                              OpBranch %69 
                                      %69 = OpLabel 
                                  i32 %70 = OpLoad %64 
                                 bool %73 = OpSLessThan %70 %71 
                                              OpBranchConditional %73 %66 %67 
                                      %66 = OpLabel 
                                  i32 %75 = OpLoad %64 
                                  f32 %76 = OpConvertSToF %75 
                                              OpStore %74 %76 
                                  f32 %77 = OpLoad %74 
                                  f32 %78 = OpFNegate %77 
                                  f32 %79 = OpFMul %78 %47 
                         Private f32* %80 = OpAccessChain %44 %59 
                                  f32 %81 = OpLoad %80 
                                  f32 %82 = OpFAdd %79 %81 
                                              OpStore %74 %82 
                                  f32 %83 = OpLoad %74 
                                  f32 %84 = OpLoad %74 
                                  f32 %85 = OpFAdd %83 %84 
                         Private f32* %87 = OpAccessChain %44 %86 
                                              OpStore %87 %85 
                                f32_4 %89 = OpLoad %44 
                                f32_2 %90 = OpVectorShuffle %89 %89 0 3 
                                f32_2 %94 = OpFAdd %90 %93 
                                f32_4 %95 = OpLoad %88 
                                f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
                                              OpStore %88 %96 
                                f32_4 %99 = OpLoad %88 
                               f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                               f32_2 %103 = OpFMul %100 %102 
                                              OpStore %98 %103 
                 read_only Texture2D %107 = OpLoad %106 
                             sampler %111 = OpLoad %110 
          read_only Texture2DSampled %113 = OpSampledImage %107 %111 
                               f32_2 %114 = OpLoad %98 
                               f32_4 %115 = OpImageSampleImplicitLod %113 %114 
                                 f32 %116 = OpCompositeExtract %115 0 
                        Private f32* %117 = OpAccessChain %98 %56 
                                              OpStore %117 %116 
                        Private f32* %118 = OpAccessChain %98 %56 
                                 f32 %119 = OpLoad %118 
                                 f32 %121 = OpFMul %119 %120 
                        Private f32* %122 = OpAccessChain %88 %61 
                                              OpStore %122 %121 
                        Private f32* %123 = OpAccessChain %98 %56 
                                 f32 %124 = OpLoad %123 
                                 f32 %125 = OpFMul %124 %120 
                                 f32 %126 = OpLoad %74 
                                 f32 %127 = OpFAdd %125 %126 
                                              OpStore %74 %127 
                        Private f32* %130 = OpAccessChain %44 %59 
                                 f32 %131 = OpLoad %130 
                                 f32 %132 = OpLoad %74 
                                bool %133 = OpFOrdLessThan %131 %132 
                                              OpStore %129 %133 
                                bool %134 = OpLoad %129 
                                              OpSelectionMerge %138 None 
                                              OpBranchConditional %134 %137 %141 
                                     %137 = OpLabel 
                               f32_4 %139 = OpLoad %88 
                               f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                              OpStore %136 %140 
                                              OpBranch %138 
                                     %141 = OpLabel 
                               f32_3 %142 = OpLoad %53 
                                              OpStore %136 %142 
                                              OpBranch %138 
                                     %138 = OpLabel 
                               f32_3 %143 = OpLoad %136 
                                              OpStore %53 %143 
                                              OpBranch %68 
                                      %68 = OpLabel 
                                 i32 %144 = OpLoad %64 
                                 i32 %146 = OpIAdd %144 %145 
                                              OpStore %64 %146 
                                              OpBranch %65 
                                      %67 = OpLabel 
                               f32_3 %147 = OpLoad %53 
                               f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                               f32_2 %149 = OpFMul %148 %102 
                               f32_4 %150 = OpLoad %9 
                               f32_4 %151 = OpVectorShuffle %150 %149 4 1 2 5 
                                              OpStore %9 %151 
                 read_only Texture2D %152 = OpLoad %106 
                             sampler %153 = OpLoad %110 
          read_only Texture2DSampled %154 = OpSampledImage %152 %153 
                               f32_4 %155 = OpLoad %9 
                               f32_2 %156 = OpVectorShuffle %155 %155 0 3 
                               f32_4 %157 = OpImageSampleImplicitLod %154 %156 
                               f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                               f32_4 %159 = OpLoad %44 
                               f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                              OpStore %44 %160 
                               f32_3 %161 = OpLoad %53 
                               f32_4 %162 = OpVectorShuffle %161 %161 0 1 0 1 
                               f32_4 %167 = OpFAdd %162 %166 
                                              OpStore %88 %167 
                               f32_4 %168 = OpLoad %88 
                               f32_4 %170 = OpFMul %168 %169 
                                              OpStore %88 %170 
                 read_only Texture2D %171 = OpLoad %106 
                             sampler %172 = OpLoad %110 
          read_only Texture2DSampled %173 = OpSampledImage %171 %172 
                               f32_4 %174 = OpLoad %88 
                               f32_2 %175 = OpVectorShuffle %174 %174 0 1 
                               f32_4 %176 = OpImageSampleImplicitLod %173 %175 
                                 f32 %177 = OpCompositeExtract %176 0 
                        Private f32* %178 = OpAccessChain %9 %56 
                                              OpStore %178 %177 
                 read_only Texture2D %179 = OpLoad %106 
                             sampler %180 = OpLoad %110 
          read_only Texture2DSampled %181 = OpSampledImage %179 %180 
                               f32_4 %182 = OpLoad %88 
                               f32_2 %183 = OpVectorShuffle %182 %182 2 3 
                               f32_4 %184 = OpImageSampleImplicitLod %181 %183 
                                 f32 %185 = OpCompositeExtract %184 0 
                                              OpStore %74 %185 
                                 f32 %186 = OpLoad %74 
                                 f32 %187 = OpFMul %186 %120 
                                              OpStore %74 %187 
                        Private f32* %188 = OpAccessChain %9 %56 
                                 f32 %189 = OpLoad %188 
                                 f32 %190 = OpFMul %189 %120 
                                 f32 %191 = OpLoad %74 
                                 f32 %192 = OpFNegate %191 
                                 f32 %193 = OpFAdd %190 %192 
                        Private f32* %194 = OpAccessChain %9 %56 
                                              OpStore %194 %193 
                        Private f32* %195 = OpAccessChain %9 %56 
                                 f32 %196 = OpLoad %195 
                                 f32 %198 = OpExtInst %1 40 %196 %197 
                        Private f32* %199 = OpAccessChain %88 %59 
                                              OpStore %199 %198 
                               f32_3 %201 = OpLoad %53 
                               f32_4 %202 = OpVectorShuffle %201 %201 0 1 0 1 
                               f32_4 %204 = OpFAdd %202 %203 
                                              OpStore %200 %204 
                               f32_4 %205 = OpLoad %200 
                               f32_4 %206 = OpFMul %205 %169 
                                              OpStore %200 %206 
                 read_only Texture2D %207 = OpLoad %106 
                             sampler %208 = OpLoad %110 
          read_only Texture2DSampled %209 = OpSampledImage %207 %208 
                               f32_4 %210 = OpLoad %200 
                               f32_2 %211 = OpVectorShuffle %210 %210 0 1 
                               f32_4 %212 = OpImageSampleImplicitLod %209 %211 
                                 f32 %213 = OpCompositeExtract %212 0 
                        Private f32* %214 = OpAccessChain %9 %56 
                                              OpStore %214 %213 
                 read_only Texture2D %215 = OpLoad %106 
                             sampler %216 = OpLoad %110 
          read_only Texture2DSampled %217 = OpSampledImage %215 %216 
                               f32_4 %218 = OpLoad %200 
                               f32_2 %219 = OpVectorShuffle %218 %218 2 3 
                               f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                 f32 %221 = OpCompositeExtract %220 0 
                                              OpStore %74 %221 
                                 f32 %222 = OpLoad %74 
                                 f32 %223 = OpFMul %222 %120 
                                              OpStore %74 %223 
                        Private f32* %224 = OpAccessChain %9 %56 
                                 f32 %225 = OpLoad %224 
                                 f32 %226 = OpFMul %225 %120 
                                 f32 %227 = OpLoad %74 
                                 f32 %228 = OpFNegate %227 
                                 f32 %229 = OpFAdd %226 %228 
                        Private f32* %230 = OpAccessChain %9 %56 
                                              OpStore %230 %229 
                        Private f32* %231 = OpAccessChain %9 %56 
                                 f32 %232 = OpLoad %231 
                                 f32 %233 = OpExtInst %1 40 %232 %197 
                        Private f32* %234 = OpAccessChain %88 %56 
                                              OpStore %234 %233 
                               f32_4 %235 = OpLoad %88 
                               f32_2 %236 = OpVectorShuffle %235 %235 0 1 
                               f32_2 %239 = OpFMul %236 %238 
                               f32_4 %240 = OpLoad %88 
                               f32_4 %241 = OpVectorShuffle %240 %239 4 5 2 3 
                                              OpStore %88 %241 
                        Private f32* %243 = OpAccessChain %88 %61 
                                              OpStore %243 %242 
                               f32_4 %244 = OpLoad %88 
                               f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                               f32_4 %246 = OpLoad %88 
                               f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                 f32 %248 = OpDot %245 %247 
                        Private f32* %249 = OpAccessChain %9 %56 
                                              OpStore %249 %248 
                        Private f32* %250 = OpAccessChain %9 %56 
                                 f32 %251 = OpLoad %250 
                                 f32 %252 = OpExtInst %1 32 %251 
                        Private f32* %253 = OpAccessChain %9 %56 
                                              OpStore %253 %252 
                               f32_4 %254 = OpLoad %9 
                               f32_2 %255 = OpVectorShuffle %254 %254 0 0 
                               f32_4 %256 = OpLoad %88 
                               f32_2 %257 = OpVectorShuffle %256 %256 0 2 
                               f32_2 %258 = OpFMul %255 %257 
                               f32_4 %259 = OpLoad %9 
                               f32_4 %260 = OpVectorShuffle %259 %258 4 1 2 5 
                                              OpStore %9 %260 
                               f32_4 %261 = OpLoad %9 
                               f32_2 %262 = OpVectorShuffle %261 %261 0 3 
                                 f32 %266 = OpDot %262 %265 
                        Private f32* %267 = OpAccessChain %9 %56 
                                              OpStore %267 %266 
                        Private f32* %268 = OpAccessChain %9 %56 
                                 f32 %269 = OpLoad %268 
                                 f32 %270 = OpExtInst %1 40 %269 %120 
                                              OpStore %74 %270 
                                 f32 %271 = OpLoad %74 
                               f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                               f32_4 %273 = OpLoad %44 
                               f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                               f32_3 %275 = OpFMul %272 %274 
                               f32_4 %276 = OpLoad %44 
                               f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                              OpStore %44 %277 
                        Private f32* %278 = OpAccessChain %9 %56 
                                 f32 %279 = OpLoad %278 
                        Private f32* %280 = OpAccessChain %9 %56 
                                 f32 %281 = OpLoad %280 
                                 f32 %282 = OpFMul %279 %281 
                        Private f32* %283 = OpAccessChain %9 %56 
                                              OpStore %283 %282 
                        Private f32* %284 = OpAccessChain %9 %56 
                                 f32 %285 = OpLoad %284 
                        Private f32* %286 = OpAccessChain %9 %56 
                                 f32 %287 = OpLoad %286 
                                 f32 %288 = OpFMul %285 %287 
                                              OpStore %74 %288 
                        Private f32* %289 = OpAccessChain %9 %56 
                                 f32 %290 = OpLoad %289 
                                 f32 %291 = OpLoad %74 
                                 f32 %292 = OpFMul %290 %291 
                                 f32 %294 = OpFAdd %292 %293 
                        Private f32* %295 = OpAccessChain %9 %56 
                                              OpStore %295 %294 
                               f32_4 %296 = OpLoad %9 
                               f32_3 %297 = OpVectorShuffle %296 %296 0 0 0 
                               f32_4 %298 = OpLoad %44 
                               f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                               f32_3 %300 = OpFMul %297 %299 
                               f32_4 %301 = OpLoad %44 
                               f32_4 %302 = OpVectorShuffle %301 %300 4 5 6 3 
                                              OpStore %44 %302 
                               f32_4 %303 = OpLoad %9 
                               f32_2 %304 = OpVectorShuffle %303 %303 2 1 
                               f32_2 %307 = OpFMul %304 %306 
                               f32_2 %310 = OpFAdd %307 %309 
                               f32_3 %311 = OpLoad %53 
                               f32_3 %312 = OpVectorShuffle %311 %310 3 4 2 
                                              OpStore %53 %312 
                               f32_3 %313 = OpLoad %53 
                               f32_3 %314 = OpLoad %53 
                                 f32 %315 = OpDot %313 %314 
                        Private f32* %316 = OpAccessChain %9 %56 
                                              OpStore %316 %315 
                        Private f32* %318 = OpAccessChain %9 %56 
                                 f32 %319 = OpLoad %318 
                                 f32 %320 = OpFNegate %319 
                                 f32 %321 = OpFAdd %320 %293 
                                              OpStore %317 %321 
                        Private f32* %322 = OpAccessChain %9 %56 
                                 f32 %323 = OpLoad %322 
                                 f32 %325 = OpFMul %323 %324 
                        Private f32* %326 = OpAccessChain %9 %56 
                                              OpStore %326 %325 
                               f32_4 %329 = OpLoad %44 
                               f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
                                 f32 %331 = OpLoad %317 
                               f32_3 %332 = OpCompositeConstruct %331 %331 %331 
                               f32_3 %333 = OpFMul %330 %332 
                               f32_4 %334 = OpLoad %9 
                               f32_3 %335 = OpVectorShuffle %334 %334 0 0 0 
                               f32_3 %336 = OpFAdd %333 %335 
                               f32_4 %337 = OpLoad %328 
                               f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
                                              OpStore %328 %338 
                         Output f32* %340 = OpAccessChain %328 %86 
                                              OpStore %340 %293 
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
}
}