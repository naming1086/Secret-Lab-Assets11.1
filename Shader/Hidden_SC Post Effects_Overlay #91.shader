//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Overlay" {
Properties {
}
SubShader {
 Pass {
  Name "Texture overlay"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 37549
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _OverlayTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat10;
float u_xlat15;
bool u_xlatb16;
void main()
{
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat10 = _ScreenParams.x / _ScreenParams.y;
    u_xlat10 = u_xlat10 * vs_TEXCOORD0.x;
    u_xlatb1 = equal(_Params.zwww, vec4(1.0, 0.0, 1.0, 2.0));
    u_xlat0.x = (u_xlatb1.x) ? u_xlat10 : vs_TEXCOORD0.x;
    u_xlat0.xy = u_xlat0.xy * _Params.yy;
    u_xlat0 = texture(_OverlayTex, u_xlat0.xy);
    u_xlat15 = u_xlat0.w * _Params.x;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlatb1.y ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1.xyz = (u_xlatb1.z) ? u_xlat4.xyz : u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz + (-u_xlat2.xyz);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat1.xyz = (u_xlatb1.w) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlatb16 = _Params.w==3.0;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = u_xlat2.w;
    SV_Target0.xyz = (bool(u_xlatb16)) ? u_xlat0.xyz : u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 228
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %98 %211 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %21 0 Offset 21 
                                             OpMemberDecorate %21 1 Offset 21 
                                             OpDecorate %21 Block 
                                             OpDecorate %23 DescriptorSet 23 
                                             OpDecorate %23 Binding 23 
                                             OpDecorate %74 DescriptorSet 74 
                                             OpDecorate %74 Binding 74 
                                             OpDecorate %78 DescriptorSet 78 
                                             OpDecorate %78 Binding 78 
                                             OpDecorate %93 DescriptorSet 93 
                                             OpDecorate %93 Binding 93 
                                             OpDecorate %95 DescriptorSet 95 
                                             OpDecorate %95 Binding 95 
                                             OpDecorate vs_TEXCOORD1 Location 98 
                                             OpDecorate %211 Location 211 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %13 = OpTypeInt 32 0 
                                 u32 %14 = OpConstant 1 
                                     %15 = OpTypePointer Input %6 
                                     %18 = OpTypePointer Private %6 
                        Private f32* %20 = OpVariable Private 
                                     %21 = OpTypeStruct %7 %7 
                                     %22 = OpTypePointer Uniform %21 
     Uniform struct {f32_4; f32_4;}* %23 = OpVariable Uniform 
                                     %24 = OpTypeInt 32 1 
                                 i32 %25 = OpConstant 0 
                                 u32 %26 = OpConstant 0 
                                     %27 = OpTypePointer Uniform %6 
                                     %37 = OpTypeBool 
                                     %38 = OpTypeVector %37 4 
                                     %39 = OpTypePointer Private %38 
                     Private bool_4* %40 = OpVariable Private 
                                 i32 %41 = OpConstant 1 
                                     %42 = OpTypePointer Uniform %7 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                               f32_4 %49 = OpConstantComposite %46 %47 %46 %48 
                                     %51 = OpTypePointer Private %37 
                                     %54 = OpTypePointer Function %6 
                                     %72 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %73 = OpTypePointer UniformConstant %72 
UniformConstant read_only Texture2D* %74 = OpVariable UniformConstant 
                                     %76 = OpTypeSampler 
                                     %77 = OpTypePointer UniformConstant %76 
            UniformConstant sampler* %78 = OpVariable UniformConstant 
                                     %80 = OpTypeSampledImage %72 
                        Private f32* %85 = OpVariable Private 
                                 u32 %86 = OpConstant 3 
                      Private f32_4* %92 = OpVariable Private 
UniformConstant read_only Texture2D* %93 = OpVariable UniformConstant 
            UniformConstant sampler* %95 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                    %101 = OpTypeVector %6 3 
                                    %102 = OpTypePointer Private %101 
                     Private f32_3* %103 = OpVariable Private 
                                    %119 = OpTypePointer Function %101 
                              f32_3 %125 = OpConstantComposite %47 %47 %47 
                     Private f32_3* %127 = OpVariable Private 
                     Private f32_3* %136 = OpVariable Private 
                                u32 %137 = OpConstant 2 
                      Private bool* %172 = OpVariable Private 
                                f32 %175 = OpConstant 3.674022E-40 
                                    %210 = OpTypePointer Output %7 
                      Output f32_4* %211 = OpVariable Output 
                                    %214 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                       Function f32* %55 = OpVariable Function 
                    Function f32_3* %120 = OpVariable Function 
                    Function f32_3* %140 = OpVariable Function 
                    Function f32_3* %165 = OpVariable Function 
                    Function f32_3* %217 = OpVariable Function 
                          Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                 f32 %17 = OpLoad %16 
                        Private f32* %19 = OpAccessChain %9 %14 
                                             OpStore %19 %17 
                        Uniform f32* %28 = OpAccessChain %23 %25 %26 
                                 f32 %29 = OpLoad %28 
                        Uniform f32* %30 = OpAccessChain %23 %25 %14 
                                 f32 %31 = OpLoad %30 
                                 f32 %32 = OpFDiv %29 %31 
                                             OpStore %20 %32 
                                 f32 %33 = OpLoad %20 
                          Input f32* %34 = OpAccessChain vs_TEXCOORD0 %26 
                                 f32 %35 = OpLoad %34 
                                 f32 %36 = OpFMul %33 %35 
                                             OpStore %20 %36 
                      Uniform f32_4* %43 = OpAccessChain %23 %41 
                               f32_4 %44 = OpLoad %43 
                               f32_4 %45 = OpVectorShuffle %44 %44 2 3 3 3 
                              bool_4 %50 = OpFOrdEqual %45 %49 
                                             OpStore %40 %50 
                       Private bool* %52 = OpAccessChain %40 %26 
                                bool %53 = OpLoad %52 
                                             OpSelectionMerge %57 None 
                                             OpBranchConditional %53 %56 %59 
                                     %56 = OpLabel 
                                 f32 %58 = OpLoad %20 
                                             OpStore %55 %58 
                                             OpBranch %57 
                                     %59 = OpLabel 
                          Input f32* %60 = OpAccessChain vs_TEXCOORD0 %26 
                                 f32 %61 = OpLoad %60 
                                             OpStore %55 %61 
                                             OpBranch %57 
                                     %57 = OpLabel 
                                 f32 %62 = OpLoad %55 
                        Private f32* %63 = OpAccessChain %9 %26 
                                             OpStore %63 %62 
                               f32_4 %64 = OpLoad %9 
                               f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                      Uniform f32_4* %66 = OpAccessChain %23 %41 
                               f32_4 %67 = OpLoad %66 
                               f32_2 %68 = OpVectorShuffle %67 %67 1 1 
                               f32_2 %69 = OpFMul %65 %68 
                               f32_4 %70 = OpLoad %9 
                               f32_4 %71 = OpVectorShuffle %70 %69 4 5 2 3 
                                             OpStore %9 %71 
                 read_only Texture2D %75 = OpLoad %74 
                             sampler %79 = OpLoad %78 
          read_only Texture2DSampled %81 = OpSampledImage %75 %79 
                               f32_4 %82 = OpLoad %9 
                               f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                               f32_4 %84 = OpImageSampleImplicitLod %81 %83 
                                             OpStore %9 %84 
                        Private f32* %87 = OpAccessChain %9 %86 
                                 f32 %88 = OpLoad %87 
                        Uniform f32* %89 = OpAccessChain %23 %41 %26 
                                 f32 %90 = OpLoad %89 
                                 f32 %91 = OpFMul %88 %90 
                                             OpStore %85 %91 
                 read_only Texture2D %94 = OpLoad %93 
                             sampler %96 = OpLoad %95 
          read_only Texture2DSampled %97 = OpSampledImage %94 %96 
                               f32_2 %99 = OpLoad vs_TEXCOORD1 
                              f32_4 %100 = OpImageSampleImplicitLod %97 %99 
                                             OpStore %92 %100 
                              f32_4 %104 = OpLoad %9 
                              f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              f32_4 %106 = OpLoad %92 
                              f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                              f32_3 %108 = OpFNegate %107 
                              f32_3 %109 = OpFAdd %105 %108 
                                             OpStore %103 %109 
                                f32 %110 = OpLoad %85 
                              f32_3 %111 = OpCompositeConstruct %110 %110 %110 
                              f32_3 %112 = OpLoad %103 
                              f32_3 %113 = OpFMul %111 %112 
                              f32_4 %114 = OpLoad %92 
                              f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              f32_3 %116 = OpFAdd %113 %115 
                                             OpStore %103 %116 
                      Private bool* %117 = OpAccessChain %40 %14 
                               bool %118 = OpLoad %117 
                                             OpSelectionMerge %122 None 
                                             OpBranchConditional %118 %121 %124 
                                    %121 = OpLabel 
                              f32_3 %123 = OpLoad %103 
                                             OpStore %120 %123 
                                             OpBranch %122 
                                    %124 = OpLabel 
                                             OpStore %120 %125 
                                             OpBranch %122 
                                    %122 = OpLabel 
                              f32_3 %126 = OpLoad %120 
                                             OpStore %103 %126 
                                f32 %128 = OpLoad %85 
                              f32_3 %129 = OpCompositeConstruct %128 %128 %128 
                              f32_4 %130 = OpLoad %9 
                              f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              f32_3 %132 = OpFMul %129 %131 
                              f32_4 %133 = OpLoad %92 
                              f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                              f32_3 %135 = OpFAdd %132 %134 
                                             OpStore %127 %135 
                      Private bool* %138 = OpAccessChain %40 %137 
                               bool %139 = OpLoad %138 
                                             OpSelectionMerge %142 None 
                                             OpBranchConditional %139 %141 %144 
                                    %141 = OpLabel 
                              f32_3 %143 = OpLoad %127 
                                             OpStore %140 %143 
                                             OpBranch %142 
                                    %144 = OpLabel 
                              f32_3 %145 = OpLoad %103 
                                             OpStore %140 %145 
                                             OpBranch %142 
                                    %142 = OpLabel 
                              f32_3 %146 = OpLoad %140 
                                             OpStore %136 %146 
                              f32_4 %147 = OpLoad %9 
                              f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                              f32_4 %149 = OpLoad %92 
                              f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              f32_3 %151 = OpFMul %148 %150 
                              f32_4 %152 = OpLoad %92 
                              f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              f32_3 %154 = OpFNegate %153 
                              f32_3 %155 = OpFAdd %151 %154 
                                             OpStore %103 %155 
                                f32 %156 = OpLoad %85 
                              f32_3 %157 = OpCompositeConstruct %156 %156 %156 
                              f32_3 %158 = OpLoad %103 
                              f32_3 %159 = OpFMul %157 %158 
                              f32_4 %160 = OpLoad %92 
                              f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                              f32_3 %162 = OpFAdd %159 %161 
                                             OpStore %103 %162 
                      Private bool* %163 = OpAccessChain %40 %86 
                               bool %164 = OpLoad %163 
                                             OpSelectionMerge %167 None 
                                             OpBranchConditional %164 %166 %169 
                                    %166 = OpLabel 
                              f32_3 %168 = OpLoad %103 
                                             OpStore %165 %168 
                                             OpBranch %167 
                                    %169 = OpLabel 
                              f32_3 %170 = OpLoad %136 
                                             OpStore %165 %170 
                                             OpBranch %167 
                                    %167 = OpLabel 
                              f32_3 %171 = OpLoad %165 
                                             OpStore %136 %171 
                       Uniform f32* %173 = OpAccessChain %23 %41 %86 
                                f32 %174 = OpLoad %173 
                               bool %176 = OpFOrdEqual %174 %175 
                                             OpStore %172 %176 
                              f32_4 %177 = OpLoad %9 
                              f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                              f32_4 %179 = OpLoad %92 
                              f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                              f32_3 %181 = OpFAdd %178 %180 
                                             OpStore %103 %181 
                              f32_4 %182 = OpLoad %9 
                              f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                              f32_3 %184 = OpFNegate %183 
                              f32_4 %185 = OpLoad %92 
                              f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              f32_3 %187 = OpFMul %184 %186 
                              f32_3 %188 = OpLoad %103 
                              f32_3 %189 = OpFAdd %187 %188 
                              f32_4 %190 = OpLoad %9 
                              f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                             OpStore %9 %191 
                              f32_4 %192 = OpLoad %92 
                              f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                              f32_3 %194 = OpFNegate %193 
                              f32_4 %195 = OpLoad %9 
                              f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                              f32_3 %197 = OpFAdd %194 %196 
                              f32_4 %198 = OpLoad %9 
                              f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                             OpStore %9 %199 
                                f32 %200 = OpLoad %85 
                              f32_3 %201 = OpCompositeConstruct %200 %200 %200 
                              f32_4 %202 = OpLoad %9 
                              f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                              f32_3 %204 = OpFMul %201 %203 
                              f32_4 %205 = OpLoad %92 
                              f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
                              f32_3 %207 = OpFAdd %204 %206 
                              f32_4 %208 = OpLoad %9 
                              f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
                                             OpStore %9 %209 
                       Private f32* %212 = OpAccessChain %92 %86 
                                f32 %213 = OpLoad %212 
                        Output f32* %215 = OpAccessChain %211 %86 
                                             OpStore %215 %213 
                               bool %216 = OpLoad %172 
                                             OpSelectionMerge %219 None 
                                             OpBranchConditional %216 %218 %222 
                                    %218 = OpLabel 
                              f32_4 %220 = OpLoad %9 
                              f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                             OpStore %217 %221 
                                             OpBranch %219 
                                    %222 = OpLabel 
                              f32_3 %223 = OpLoad %136 
                                             OpStore %217 %223 
                                             OpBranch %219 
                                    %219 = OpLabel 
                              f32_3 %224 = OpLoad %217 
                              f32_4 %225 = OpLoad %211 
                              f32_4 %226 = OpVectorShuffle %225 %224 4 5 6 3 
                                             OpStore %211 %226 
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