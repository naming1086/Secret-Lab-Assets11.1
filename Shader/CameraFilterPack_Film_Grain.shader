//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Film_Grain" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 63709
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
uniform 	float _TimeX;
uniform 	float _Value;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat0.xy + vec2(4.0, 4.0);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat4.y * u_xlat4.x;
    u_xlat0.x = u_xlat0.x * _TimeX;
    u_xlat0.xy = u_xlat0.xx * vec2(0.769230783, 0.08130081);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(13.0, 123.0) + vec2(1.0, 1.0);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 100.0;
    u_xlatb2 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb2) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.00999999978 + -0.00499999989;
    u_xlat0.x = u_xlat0.x * _Value;
    u_xlat2 = dot(u_xlat1.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
    u_xlat2 = (-u_xlat2) + 0.5;
    SV_Target0.xyz = vec3(u_xlat2) * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
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
; Bound: 206
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %189 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate %189 Location 189 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %13 = OpTypeVector %6 4 
                                     %14 = OpTypeStruct %6 %6 %13 
                                     %15 = OpTypePointer Uniform %14 
  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 2 
                                     %19 = OpTypePointer Uniform %13 
                      Private f32_2* %28 = OpVariable Private 
                                 f32 %30 = OpConstant 3.674022E-40 
                               f32_2 %31 = OpConstantComposite %30 %30 
                                     %33 = OpTypePointer Private %13 
                      Private f32_4* %34 = OpVariable Private 
                                     %35 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %36 = OpTypePointer UniformConstant %35 
UniformConstant read_only Texture2D* %37 = OpVariable UniformConstant 
                                     %39 = OpTypeSampler 
                                     %40 = OpTypePointer UniformConstant %39 
            UniformConstant sampler* %41 = OpVariable UniformConstant 
                                     %43 = OpTypeSampledImage %35 
                                     %47 = OpTypeInt 32 0 
                                 u32 %48 = OpConstant 1 
                                     %49 = OpTypePointer Private %6 
                                 u32 %52 = OpConstant 0 
                                 i32 %59 = OpConstant 0 
                                     %60 = OpTypePointer Uniform %6 
                                 f32 %67 = OpConstant 3.674022E-40 
                                 f32 %68 = OpConstant 3.674022E-40 
                               f32_2 %69 = OpConstantComposite %67 %68 
                                     %71 = OpTypeBool 
                                     %72 = OpTypeVector %71 2 
                                     %73 = OpTypePointer Private %72 
                     Private bool_2* %74 = OpVariable Private 
                                     %80 = OpTypeVector %71 4 
                                     %86 = OpTypePointer Function %7 
                                     %89 = OpTypePointer Private %71 
                                     %92 = OpTypePointer Function %6 
                                f32 %119 = OpConstant 3.674022E-40 
                                f32 %120 = OpConstant 3.674022E-40 
                              f32_2 %121 = OpConstantComposite %119 %120 
                                f32 %123 = OpConstant 3.674022E-40 
                              f32_2 %124 = OpConstantComposite %123 %123 
                                f32 %134 = OpConstant 3.674022E-40 
                      Private bool* %137 = OpVariable Private 
                                f32 %163 = OpConstant 3.674022E-40 
                                f32 %165 = OpConstant 3.674022E-40 
                                i32 %170 = OpConstant 1 
                       Private f32* %175 = OpVariable Private 
                                    %176 = OpTypeVector %6 3 
                                f32 %179 = OpConstant 3.674022E-40 
                                f32 %180 = OpConstant 3.674022E-40 
                                f32 %181 = OpConstant 3.674022E-40 
                              f32_3 %182 = OpConstantComposite %179 %180 %181 
                                f32 %186 = OpConstant 3.674022E-40 
                                    %188 = OpTypePointer Output %13 
                      Output f32_4* %189 = OpVariable Output 
                                u32 %200 = OpConstant 3 
                                    %203 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                     Function f32_2* %87 = OpVariable Function 
                       Function f32* %93 = OpVariable Function 
                      Function f32* %106 = OpVariable Function 
                      Function f32* %150 = OpVariable Function 
                               f32_2 %12 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %20 = OpAccessChain %16 %18 
                               f32_4 %21 = OpLoad %20 
                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                               f32_2 %23 = OpFMul %12 %22 
                      Uniform f32_4* %24 = OpAccessChain %16 %18 
                               f32_4 %25 = OpLoad %24 
                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                               f32_2 %27 = OpFAdd %23 %26 
                                             OpStore %9 %27 
                               f32_2 %29 = OpLoad %9 
                               f32_2 %32 = OpFAdd %29 %31 
                                             OpStore %28 %32 
                 read_only Texture2D %38 = OpLoad %37 
                             sampler %42 = OpLoad %41 
          read_only Texture2DSampled %44 = OpSampledImage %38 %42 
                               f32_2 %45 = OpLoad %9 
                               f32_4 %46 = OpImageSampleImplicitLod %44 %45 
                                             OpStore %34 %46 
                        Private f32* %50 = OpAccessChain %28 %48 
                                 f32 %51 = OpLoad %50 
                        Private f32* %53 = OpAccessChain %28 %52 
                                 f32 %54 = OpLoad %53 
                                 f32 %55 = OpFMul %51 %54 
                        Private f32* %56 = OpAccessChain %9 %52 
                                             OpStore %56 %55 
                        Private f32* %57 = OpAccessChain %9 %52 
                                 f32 %58 = OpLoad %57 
                        Uniform f32* %61 = OpAccessChain %16 %59 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpFMul %58 %62 
                        Private f32* %64 = OpAccessChain %9 %52 
                                             OpStore %64 %63 
                               f32_2 %65 = OpLoad %9 
                               f32_2 %66 = OpVectorShuffle %65 %65 0 0 
                               f32_2 %70 = OpFMul %66 %69 
                                             OpStore %9 %70 
                               f32_2 %75 = OpLoad %9 
                               f32_4 %76 = OpVectorShuffle %75 %75 0 1 0 1 
                               f32_2 %77 = OpLoad %9 
                               f32_4 %78 = OpVectorShuffle %77 %77 0 1 0 1 
                               f32_4 %79 = OpFNegate %78 
                              bool_4 %81 = OpFOrdGreaterThanEqual %76 %79 
                              bool_2 %82 = OpVectorShuffle %81 %81 0 1 
                                             OpStore %74 %82 
                               f32_2 %83 = OpLoad %9 
                               f32_2 %84 = OpExtInst %1 4 %83 
                               f32_2 %85 = OpExtInst %1 10 %84 
                                             OpStore %9 %85 
                               f32_2 %88 = OpLoad %9 
                                             OpStore %87 %88 
                       Private bool* %90 = OpAccessChain %74 %52 
                                bool %91 = OpLoad %90 
                                             OpSelectionMerge %95 None 
                                             OpBranchConditional %91 %94 %98 
                                     %94 = OpLabel 
                        Private f32* %96 = OpAccessChain %9 %52 
                                 f32 %97 = OpLoad %96 
                                             OpStore %93 %97 
                                             OpBranch %95 
                                     %98 = OpLabel 
                        Private f32* %99 = OpAccessChain %9 %52 
                                f32 %100 = OpLoad %99 
                                f32 %101 = OpFNegate %100 
                                             OpStore %93 %101 
                                             OpBranch %95 
                                     %95 = OpLabel 
                                f32 %102 = OpLoad %93 
                      Function f32* %103 = OpAccessChain %87 %52 
                                             OpStore %103 %102 
                      Private bool* %104 = OpAccessChain %74 %48 
                               bool %105 = OpLoad %104 
                                             OpSelectionMerge %108 None 
                                             OpBranchConditional %105 %107 %111 
                                    %107 = OpLabel 
                       Private f32* %109 = OpAccessChain %9 %48 
                                f32 %110 = OpLoad %109 
                                             OpStore %106 %110 
                                             OpBranch %108 
                                    %111 = OpLabel 
                       Private f32* %112 = OpAccessChain %9 %48 
                                f32 %113 = OpLoad %112 
                                f32 %114 = OpFNegate %113 
                                             OpStore %106 %114 
                                             OpBranch %108 
                                    %108 = OpLabel 
                                f32 %115 = OpLoad %106 
                      Function f32* %116 = OpAccessChain %87 %48 
                                             OpStore %116 %115 
                              f32_2 %117 = OpLoad %87 
                                             OpStore %9 %117 
                              f32_2 %118 = OpLoad %9 
                              f32_2 %122 = OpFMul %118 %121 
                              f32_2 %125 = OpFAdd %122 %124 
                                             OpStore %9 %125 
                       Private f32* %126 = OpAccessChain %9 %48 
                                f32 %127 = OpLoad %126 
                       Private f32* %128 = OpAccessChain %9 %52 
                                f32 %129 = OpLoad %128 
                                f32 %130 = OpFMul %127 %129 
                       Private f32* %131 = OpAccessChain %9 %52 
                                             OpStore %131 %130 
                       Private f32* %132 = OpAccessChain %9 %52 
                                f32 %133 = OpLoad %132 
                                f32 %135 = OpFMul %133 %134 
                       Private f32* %136 = OpAccessChain %9 %52 
                                             OpStore %136 %135 
                       Private f32* %138 = OpAccessChain %9 %52 
                                f32 %139 = OpLoad %138 
                       Private f32* %140 = OpAccessChain %9 %52 
                                f32 %141 = OpLoad %140 
                                f32 %142 = OpFNegate %141 
                               bool %143 = OpFOrdGreaterThanEqual %139 %142 
                                             OpStore %137 %143 
                       Private f32* %144 = OpAccessChain %9 %52 
                                f32 %145 = OpLoad %144 
                                f32 %146 = OpExtInst %1 4 %145 
                                f32 %147 = OpExtInst %1 10 %146 
                       Private f32* %148 = OpAccessChain %9 %52 
                                             OpStore %148 %147 
                               bool %149 = OpLoad %137 
                                             OpSelectionMerge %152 None 
                                             OpBranchConditional %149 %151 %155 
                                    %151 = OpLabel 
                       Private f32* %153 = OpAccessChain %9 %52 
                                f32 %154 = OpLoad %153 
                                             OpStore %150 %154 
                                             OpBranch %152 
                                    %155 = OpLabel 
                       Private f32* %156 = OpAccessChain %9 %52 
                                f32 %157 = OpLoad %156 
                                f32 %158 = OpFNegate %157 
                                             OpStore %150 %158 
                                             OpBranch %152 
                                    %152 = OpLabel 
                                f32 %159 = OpLoad %150 
                       Private f32* %160 = OpAccessChain %9 %52 
                                             OpStore %160 %159 
                       Private f32* %161 = OpAccessChain %9 %52 
                                f32 %162 = OpLoad %161 
                                f32 %164 = OpFMul %162 %163 
                                f32 %166 = OpFAdd %164 %165 
                       Private f32* %167 = OpAccessChain %9 %52 
                                             OpStore %167 %166 
                       Private f32* %168 = OpAccessChain %9 %52 
                                f32 %169 = OpLoad %168 
                       Uniform f32* %171 = OpAccessChain %16 %170 
                                f32 %172 = OpLoad %171 
                                f32 %173 = OpFMul %169 %172 
                       Private f32* %174 = OpAccessChain %9 %52 
                                             OpStore %174 %173 
                              f32_4 %177 = OpLoad %34 
                              f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                f32 %183 = OpDot %178 %182 
                                             OpStore %175 %183 
                                f32 %184 = OpLoad %175 
                                f32 %185 = OpFNegate %184 
                                f32 %187 = OpFAdd %185 %186 
                                             OpStore %175 %187 
                                f32 %190 = OpLoad %175 
                              f32_3 %191 = OpCompositeConstruct %190 %190 %190 
                              f32_2 %192 = OpLoad %9 
                              f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                              f32_3 %194 = OpFMul %191 %193 
                              f32_4 %195 = OpLoad %34 
                              f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                              f32_3 %197 = OpFAdd %194 %196 
                              f32_4 %198 = OpLoad %189 
                              f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                             OpStore %189 %199 
                       Private f32* %201 = OpAccessChain %34 %200 
                                f32 %202 = OpLoad %201 
                        Output f32* %204 = OpAccessChain %189 %200 
                                             OpStore %204 %202 
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